module Helpers
  def deep_group_by(collection, group_fields, index)
    return collection if group_fields[index].nil?

    field = group_fields[index]
    collection = collection.group_by(&field.to_sym)
    collection.keys.each do |response_key|
      collection[response_key] = deep_group_by(collection[response_key], group_fields, index+1)
    end
    collection
  end
end