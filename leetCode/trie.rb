class Trie

=begin
    Initialize your data structure here.
=end
    attr_reader :trie
    def initialize()
        @trie = {}
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
        @trie[word] = true 
    end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        return true if @trie[word]
        return false
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
        @trie.keys.each do |k|
            return true if k[0..prefix.length-1] == prefix
        end
        return false
    end


end

# Your Trie object will be instantiated and called as such:
word = "apple"
prefix = "ap"
obj = Trie.new()
obj.insert(word)
obj.insert("banana")
param_2 = obj.search(word)
param_3 = obj.starts_with(prefix)