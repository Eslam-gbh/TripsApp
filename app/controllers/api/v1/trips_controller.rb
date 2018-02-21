require "json"

STATUSES = [
    'started',
    'ongoing',
    'completed'
]

module Api
  module V1
    class TripsController < ApplicationController

      # GET api/vapi/v1/trips
      def index
        trips = Trip.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded trips', data:trips}, status: :ok
      end

      # GET api/v1/trips/1
      def show
        trip = Trip.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded trip', data:trip},status: :ok
      end

      # POST api/v1/trips
      def create
        t_params = trip_params
        t_params["location"] = convert_location(t_params["location"])
        trip = Trip.new(t_params)
        if not validate_state(t_params,trip)
          render json: {status: 'ERROR', message:'Trip not saved', data:trip.errors},status: :not_valid_state
        elsif trip.save
          render json: {status: 'SUCCESS', message:'Saved trip', data:trip},status: :ok
        else
          render json: {status: 'ERROR', message:'Trip not saved', data:trip.errors},status: :unprocessable_entity
        end
      end

      # DELETE api/v1/trips/1
      def destroy
        trip = Trip.find(params[:id])
        trip.destroy
        render json: {status: 'SUCCESS', message:'Deleted trip', data:trip},status: :ok
      end

      # PATCH/PUT api/v1/trips/1
      def update
        trip = Trip.find(params[:id])
        t_params = trip_params
        t_params["location"] = append_location(t_params["location"], trip)

        if not validate_state(t_params,trip)
          render json: {
            status: 'ERROR',
            message:'Trip not updated duo to not valid state submission',
            data:trip.errors
          },status: :not_valid_state
        elsif trip.update_attributes(t_params)
          render json: {status: 'SUCCESS', message:'Updated trip', data:trip},status: :ok
        else
          render json: {status: 'ERROR', message:'Trip not updated', data:trip.errors},status: :unprocessable_entity
        end
      end

      private

        def trip_params
          params.permit(:driver, :state, :location, :start_at, :completed_at)
        end

        def convert_location(location)
          # serialize the location and send an stringified array
          return [location].to_s
        end

        def append_location(location, trip)
          # convert location field back to array and add the new location
          # it will work without to_s but its written to explict conversion
          return (eval(trip.location) << location).to_s
        end

        def validate_state(t_params, trip)
          state = t_params["state"]
          if (not t_params["start_at"].nil?) && (not t_params["completed_at"].nil?)  && (t_params["start_at"] >= t_params["completed_at"])
            return false
          elsif (not trip.state.nil?) && (STATUSES.index(state) < STATUSES.index(trip.state))
            return false
          else
            return true
          end
        end

    end
  end
end
