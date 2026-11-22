
import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int initialValue;
  final int maxValue;
  final Duration animationDuration;
  final Color? primaryColor;

  const AnimatedCounter({
    super.key,
    this.initialValue = 0,
    this.maxValue = 100,
    this.animationDuration = const Duration(milliseconds: 300),
    this.primaryColor,
  }) : assert(maxValue > 0);

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late int value;

  @override
  void initState() {
    super.initState();

    value = widget.initialValue.clamp(0, widget.maxValue);

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _animation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.value = 1.0;
  }

  void changeValue(int change) {
    if (value + change < 0 || value + change > widget.maxValue) {
      return;
    }

    setState(() {
      value += change;
    });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMax = value == widget.maxValue;

    return Column(
      children: [
        ScaleTransition(
          scale: _animation,
          child: AnimatedContainer(
            duration: widget.animationDuration,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isMax
                  ? Colors.green
                  : widget.primaryColor ?? Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$value / ${widget.maxValue}',
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        TweenAnimationBuilder<double>(
          tween: Tween(
            begin: 0,
            end: value / widget.maxValue,
          ),
          duration: widget.animationDuration,
          builder: (context, progress, child) {
            return LinearProgressIndicator(
              value: progress,
              minHeight: 8,
            );
          },
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: IconButton(
                onPressed: value > 0 ? () => changeValue(-1) : null,
                icon: const Icon(Icons.remove),
              ),
            ),
            const SizedBox(width: 20),
            ScaleTransition(
              scale: _animation,
              child: IconButton(
                onPressed: value < widget.maxValue
                    ? () => changeValue(1)
                    : null,
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
