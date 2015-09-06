class Search
  def self.for(query)
    Post.where("name LIKE ?", "%#{query}%")
  end
end
