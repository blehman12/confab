require "spec_helper"

describe ArtsCraftsController do
  describe "routing" do

    it "routes to #index" do
      get("/arts_crafts").should route_to("arts_crafts#index")
    end

    it "routes to #new" do
      get("/arts_crafts/new").should route_to("arts_crafts#new")
    end

    it "routes to #show" do
      get("/arts_crafts/1").should route_to("arts_crafts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/arts_crafts/1/edit").should route_to("arts_crafts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/arts_crafts").should route_to("arts_crafts#create")
    end

    it "routes to #update" do
      put("/arts_crafts/1").should route_to("arts_crafts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/arts_crafts/1").should route_to("arts_crafts#destroy", :id => "1")
    end

  end
end
