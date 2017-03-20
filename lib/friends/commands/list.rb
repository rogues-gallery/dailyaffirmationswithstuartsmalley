# frozen_string_literal: true

desc "Lists friends, activities, and locations"
command :list do |list|
  list.desc "List all friends"
  list.command :friends do |list_friends|
    list_friends.flag [:in],
                      arg_name: "LOCATION",
                      desc: "List only friends in the given location",
                      type: Stripped

    list_friends.flag [:tagged],
                      arg_name: "@TAG",
                      desc: "List only friends with the given tag",
                      type: Tag

    list_friends.switch [:verbose],
                        negatable: false,
                        desc: "Output friend nicknames, locations, and tags"

    list_friends.action do |_, options|
      @introvert.list_friends(
        location_name: options[:in],
        tagged: options[:tagged],
        verbose: options[:verbose]
      )
    end
  end

  list.desc "Lists all activities"
  list.command :activities do |list_activities|
    list_activities.flag [:with],
                         arg_name: "NAME",
                         desc: "List only activities with the given friend",
                         type: Stripped

    list_activities.flag [:in],
                         arg_name: "LOCATION",
                         desc: "List only activities in the given location",
                         type: Stripped

    list_activities.flag [:tagged],
                         arg_name: "@TAG",
                         desc: "List only activities with the given tag",
                         type: Tag

    list_activities.flag [:since],
                         arg_name: "DATE",
                         desc: "List only activities on or after the given date",
                         type: InputDate

    list_activities.flag [:until],
                         arg_name: "DATE",
                         desc: "List only activities before or on the given date",
                         type: InputDate

    list_activities.action do |_, options|
      @introvert.list_activities(
        with: options[:with],
        location_name: options[:in],
        tagged: options[:tagged],
        since_date: options[:since],
        until_date: options[:until]
      )
    end
  end

  list.desc "List all locations"
  list.command :locations do |list_locations|
    list_locations.action do
      @introvert.list_locations
    end
  end

  list.desc "List all tags used"
  list.command :tags do |list_tags|
    list_tags.flag [:from],
                   arg_name: '"activities" or "friends" (default: both)',
                   desc: "List only tags from activities or friends instead of"\
                         "both"
    list_tags.action do |_, options|
      @introvert.list_tags(from: options[:from])
    end
  end

  list.desc "List favorite friends and locations"
  list.command :favorite do |list_favorite|
    list_favorite.desc "List favorite friends"
    list_favorite.command :friends do |list_favorite_friends|
      list_favorite_friends.action do
        @introvert.list_favorite_friends
      end
    end

    list_favorite.desc "List favorite locations"
    list_favorite.command :locations do |list_favorite_locations|
      list_favorite_locations.action do
        @introvert.list_favorite_locations
      end
    end
  end
end
