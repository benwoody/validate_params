module Validate
  class Location
    include ActiveModel::Validations

    attr_accessor :latitude, :longitude

    validates :latitude, presence: true, numericality: true
    validates :longitude, presence: true, numericality: true
  
    def initialize(params={})
      @latitude = params[:latitude]
      @longitude = params[:longitude]
      ActionController::Parameters.new(params).permit(:latitude,:longitude)
    end

  end
end
