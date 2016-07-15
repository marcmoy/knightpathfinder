class PolyTreeNode

  attr_accessor :value, :children
  attr_reader :parent


  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)

    unless @parent.nil?
      @parent.children.delete(self)
    end

    @parent = parent

    unless @parent.nil? || @parent.children.include?(self)
      @parent.children << self
    end

  end

  def add_child(child)
    child.parent = self unless children.include?(child)
  end

  def remove_child(child)
    raise 'not mine!' unless children.include?(child)
    child.parent = nil
    children.delete(child)
  end

  def dfs(target_value)
    return self if self.value == target_value

    children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end

    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      el = queue.shift
      return el if el.value == target_value
      el.children.each do |child|
        queue << child
      end
    end
    nil
  end
end
