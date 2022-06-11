module Rotatable

  def rotate_by_shift_A
    @rotate_hash_A = Hash[@character_set.zip(@character_set.rotate(@shift_hash[:A]))]
  end

  def rotate_by_shift_B
    @rotate_hash_B = Hash[@character_set.zip(@character_set.rotate(@shift_hash[:B]))]
  end

  def rotate_by_shift_C
    @rotate_hash_C = Hash[@character_set.zip(@character_set.rotate(@shift_hash[:C]))]
  end

  def rotate_by_shift_D
    @rotate_hash_D = Hash[@character_set.zip(@character_set.rotate(@shift_hash[:D]))]
  end
end
