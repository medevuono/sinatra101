class Quote
  @@secuence_id = 1;
  @@quotes = [{
    description: "I am not what happened to me, I am what I choose to become.",
    author: "C.G. Jung",
    id: 1
  }]

  def self.all(order)
    case order
    when "description"
      @@quotes.sort { |x,y| x[:description] <=> y[:description] }
    when "author"
      @@quotes.sort { |x,y| x[:author] <=> y[:author] }
    else
      @@quotes
    end
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
    index ? @@quotes[index] : nil
  end

  def self.update(quote)
    index = findIndexById(quote[:id])
    index ? @@quotes[index] = quote : nil
  end

  def self.delete(id)
    index = findIndexById(id)
    index ? @@quotes.delete_at(index) : nil
  end

end