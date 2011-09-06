require "spec_helper"

describe MallsController do
  describe "routing" do

    it "routes to #index" do
      get("/malls").should route_to("malls#index")
    end

    it "routes to #new" do
      get("/malls/new").should route_to("malls#new")
    end

    it "routes to #show" do
      get("/malls/1").should route_to("malls#show", :id => "1")
    end

    it "routes to #edit" do
      get("/malls/1/edit").should route_to("malls#edit", :id => "1")
    end

    it "routes to #create" do
      post("/malls").should route_to("malls#create")
    end

    it "routes to #update" do
      put("/malls/1").should route_to("malls#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/malls/1").should route_to("malls#destroy", :id => "1")
    end

  end
end
