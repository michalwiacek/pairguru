class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    unless title_brackets_closed?(record.title)
      record.errors.add(:title, 'title has open brackets')
    end
  end

  private

  def title_brackets_closed?(title)
    stack = []
    symbols = { '{' => '}', '[' => ']', '(' => ')' }
    title.each_char.with_index do |c, i|
      if symbols.key?(c)
        return false if c == symbols.key(title[i+1])
        stack << c
      end
      return false if symbols.key(c) && symbols.key(c) != stack.pop
    end
    stack.empty?
  end
end
