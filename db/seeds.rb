# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


bedrock =
{
fred:
{username: "fred", display_name: "Fred Flintstone", password: "fred", email: "bpraggastis@gmail.com"},
wilma:
{username: "wilma", display_name: "Wilma Flintstone", password: "wilma", email: "bpraggastis@gmail.com"},
barney:
{username: "barney",display_name: "Barney Rubble", password: "barney", email: "bpraggastis@gmail.com"},
betty:
{username: "betty", display_name: "Betty Rubble", password: "betty", email: "bpraggastis@gmail.com"}
}

 bedrock.keys.each do |member|
   bedrock[member][:account] = User.create(bedrock[member])
 end

fred = bedrock[:fred][:account]
wilma = bedrock[:wilma][:account]
barney = bedrock[:barney][:account]
betty = bedrock[:betty][:account]

bedrock_events =
[
  {title: "Whirled Peas Garden Plot Grand Opening Celebration",
  event_datetime: "April 1, 2015, 10am",
  location: "Whirled Peas Garden Patch",
  organizer: fred.display_name,
  contact_email: fred.email,
  description: "We will break ground for our spring planting. Please bring shovels
    and spades, comfortable clothing, and work gloves.",
  user_id: fred.id},

  {title: "Spring Planting",
    event_datetime: "April 15, 2015, 8am",
    location: "Whirled Peas Garden Patch",
    organizer: wilma.display_name,
    contact_email: wilma.email,
    description: "We will provide some seeds and tools. Come with lots
    of energy and any tools and vegetable starts you would like to contribute.",
    user_id: wilma.id},

  {title: "Weeding Day",
    event_datetime: "May 1, 2015 10am",
    location: "Whirled Peas Garden Patch",
    organizer: barney.display_name,
    contact_email: barney.email,
    description: "Bring work gloves, comfortable clothing and a hat. Lunch will be
    provided.",
    user_id: barney.id},

  {title: "Pruning and Weeding",
    event_datetime: "May 15, 2015 11:30am",
    location: "Whirled Peas Garden Patch",
    organizer: betty.display_name,
    contact_email: betty.email,
    description: "Bring your music and a side dish for potluck after working.",
    user_id: betty.id},

]

bedrock_events.each do |event|
  Event.create(event)
end
