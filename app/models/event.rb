class Event < ActiveRecord::Base
  filterrific(
    default_settings: { sorted_by: 'start ASC' },
    filter_names: [
      :search_query,
      :sorted_by,
      :with_user_id,
      # :with_created_at_gte
    ]
  )
  belongs_to :user
  has_many :attendances, foreign_key: "attended_id", dependent: :destroy
  has_many :attending_users, through: :attendances, source: :attendee
  validates :name, presence: true, length: { maximum: 140 }
  validates :theme, presence: true
  # attachment borrowed from Kate & Jin
  missing_url = 'duck.jpg'
  has_attached_file :image, 
                    styles: { medium: ["300x300>", :png], thumb: ["100x100", :png] }, 
                    default_url: missing_url
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :image, :in => 0.megabytes..2.megabytes
 
  # default_scope -> { order('start ASC') }

  
  THEME = ["Transportation","Comics","Entertainment and Media","Writing/Books","Business","Hobbies","Arts and Crafts","Technology and Science","Gaming","Other"]

  STATE = ["AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]

  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Start date (newest first)', 'start_asc'],
      ['Stop date (oldest first)', 'stop_asc'],
      ['Theme (a-z)', 'theme']
      ['Category (a-z)', 'category']
      ['Tags (a-z)', 'tags']
    ]
  end

  def attended?(user)
    attendances.find_by(attendee_id: user.id)
  end

  def attend!(user)
    attendances.create!(attendee_id: user.id)
  end

  def unattend!(user)
    attendances.find_by(attendee_id: user.id).destroy
  end

  def self.search(query)
    where("name like ?", "%#{query}%")
  end

  # Scope definitions. We implement all Filterrific filters through ActiveRecord
  # scopes. In this example we omit the implementation of the scopes for brevity.
  # Please see 'Scope patterns' for scope implementation details.
  scope :search_query, lambda { |query|
    # Filters events whose name or email matches the query
    return nil  if query.blank?

    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conds = 2
    where(
      terms.map { |term|
        "(LOWER(events.name) LIKE ? OR LOWER(events.theme) LIKE ? OR LOWER(events.category) LIKE ? OR LOWER(events.tags) LIKE ? OR LOWER(events.subcategoryA) LIKE ? OR LOWER(events.subcategoryB) LIKE ? OR LOWER(events.subcategoryC) LIKE ?)"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conds }.flatten
    )
  }
  scope :sorted_by, lambda { |sort_key|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^start_/
      # Simple sort on the start column.
      # Make sure to include the table name to avoid ambiguous column names.
      # Joining on other tables is quite common in Filterrific, and almost
      # every ActiveRecord table has a 'start' column.
      order("events.start #{ direction }")
    when /^name_/
      # Simple sort on the name colums
      order("LOWER(events.name) #{ direction }")
    when /^theme_/
      # This sorts by a event's country name, so we need to include
      # the country. We can't use JOIN since not all events might have
      # a country.
      order("LOWER(events.theme) #{ direction }")
    when /^category_/
      # This sorts by a event's country name, so we need to include
      # the country. We can't use JOIN since not all events might have
      # a country.
      order("LOWER(events.category) #{ direction }")
    when /^tags_/
      # This sorts by a event's country name, so we need to include
      # the country. We can't use JOIN since not all events might have
      # a country.
      order("LOWER(events.tags) #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  scope :with_user_id, lambda { |user_ids|
    where(user_id: [*user_ids])
  }
  scope :with_start_gte, lambda { |start|
    where(start: [*start])
  }
end
