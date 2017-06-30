class Quote
  @@secuence_id = 1;
  @@quotes = [{
    id: 1, 
    description: "I am not what happened to me, I am what I choose to become.",
    author: "C.G. Jung"
  }]

  def self.all()
    @@quotes
  end

  def self.add(quote)
    @@secuence_id += 1
    quote[:id] = @@secuence_id
    @@quotes.unshift(quote)
    @@quotes.first
  end

  def self.findIndexById(id)
    @@quotes.index { |q| q[:id] == id }
  end

  def self.findById(id)
    index = findIndexById(id)
    @@quotes[index]
  end

  def self.update(quote)
    index = findIndexById(quote[:id])
    @@quotes[index] = quote
  end

  def self.delete(id)
    index = findIndexById(id)
    @@quotes.delete_at(index)
  end

end