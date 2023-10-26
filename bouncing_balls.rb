=begin
A child is playing with a ball on the nth floor of a tall building. 
The height of this floor, h, is known. He drops the ball out of the window. 
The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).
His mother looks out of a window 1.5 meters from the ground.
How many times will the mother see the ball pass in front of her window 
(including when it's falling and bouncing?
Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer, otherwise return -1.
Note:
The ball can only be seen if the height of the rebounding ball is strictly 
greater than the window parameter.
Example: - h = 3, bounce = 0.66, window = 1.5, result is 3

PROBLEM:
h is height of floor where child is
Mother is at window a certain distance from ground
How many times will mom see ball going up and going down?
h > 0
Bounce between 0 and 1 (exclusive)
Window < h
Return -1 unless all 3 are true

EXAMPLES:
(3, 0.66, 1.5) => h = 3, bounce = 0.66, mom = 1.5
+1 going down, +1 bounce up, +1 going down again == 3
(30, 0.66, 1.5) => h = 30, bounce = 0.66, mom = 1.5
+1 going down
+1 bounce up(~20), +1 going down again(~20)
+1 bounce up(~13.33), +1 going down(~13.33)
... = 15 (bounce is constant)

THOUGHTS:
-Need a constanty changing h value multiplied with bounce
-Need a counter that increments whenever h downto 0/0 upto h passes mom/window
-Stop loop when h is less than mom/window

ALGORITHM:
-Return -1 unless h > 0 AND window < h AND (bounce greater than 0 AND less than 1)
-Set counter to 1 (to account for initial going down)
-Loop
  -Reassign h to h * bounce
  -Return counter if window <= h
  -counter += 2 (up and down)
-End loop

=end


def bouncingBall(h, bounce, window)
  return -1 unless h > 0 && window < h && (bounce * 1.0001).between?(0, 1)
  counter = 1
  loop do
    h *= bounce
    return counter if window >= h
    counter += 2
  end
end


p bouncingBall(3, 0.66, 1.5) == 3
p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3
p bouncingBall(40, 1, 10) == -1 # bounce needs to be less than 1
p bouncingBall(-5, 0.66, 1.5) == -1 # height needs to be greater than 0
p bouncingBall(1, 0.66, 0.66) == 1 # Only once on way down
p bouncingBall(1, 0.66, 1) == -1 # height needs to be greater than window
