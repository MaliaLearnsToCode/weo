if @activity.persisted?
  json.form render(partial: "activities/form", formats: :html, locals: {itinerary: @itinerary, activity: Activity.new})
  json.inserted_item render(partial: "activities/activity", formats: :html, locals: {itineraries: @itineraries, activity: @activity})
else
  json.form render(partial: "activities/form", formats: :html, locals: {itinerary: @itinerary, activity: @activity})
end
