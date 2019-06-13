# FreezingAnimation
To illustrate freezing an animation at the CALayer level, let’s explore the animatable path property of a CAShapeLayer. Consider a layer that can display a rectangle or an ellipse or any of the intermediate shapes between them. I can’t imagine what the notion of an intermediate shape between a rectangle or an ellipse may mean, let alone how to draw such an intermediate shape; but thanks to frozen animations, I don’t have to.

![A](https://github.com/Lilyeka/FreezingAnimation/blob/master/FreezingAnimation/freezingAnimation.png "")
![B](https://github.com/Lilyeka/FreezingAnimation/blob/master/FreezingAnimation/freezingAnimation2.png "")

# Transitions
A layer transition is an animation involving two “copies” of a single layer, in which the second “copy” appears to replace the first.
The entire layer exits moving down from its original place while fading away, and another copy of the very same layer enters moving down from above while fading in. If, at the same time, we change something about the layer’s contents, then the old contents will appear to exit downward while the new contents appear to enter from above
