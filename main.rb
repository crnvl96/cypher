# frozen_string_literal: true

def cypher(input, shift) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity
  letters = ('a'..'z').to_a

  len = letters.length

  up = input.chars.map.with_index { |c, idx| idx if c =~ /[A-Z]/ }

  post_cypher = input.downcase.chars.map { |c| letters[(letters.index(c) + shift) % len] if letters.include?(c) }

  restored_case = post_cypher.map.with_index { |c, idx| up.include?(idx) && c.respond_to?(:upcase) ? c.upcase : c }

  restored_case.join('')
end

puts cypher('zxcvbn', 3)
