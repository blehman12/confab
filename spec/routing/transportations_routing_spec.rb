require "spec_helper"

describe TransportationsController do
  describe "routing" do

    it "routes to #index" do
      get("/transportations").should route_to("transportations#index")
    end

    it "routes to #new" do
      get("/transportations/new").should route_to("transportations#new")
    end

    it "routes to #show" do
      get("/transportations/1").should route_to("transportations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transportations/1/edit").should route_to("transportations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transportations").should route_to("transportations#create")
    end

    it "routes to #update" do
      put("/transportations/1").should route_to("transportations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transportations/1").should route_to("transportations#destroy", :id => "1")
    end

  end
end
