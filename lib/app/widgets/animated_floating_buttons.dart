import 'package:flutter/material.dart';

class AnimatedFloatingButtons extends StatefulWidget {
  final List<IconData> iconItems;
  final IconData primaryButtonIcon;
  final onPressedCallBack;

  const AnimatedFloatingButtons({
    Key? key,
    required this.iconItems,
    required this.primaryButtonIcon,
    this.onPressedCallBack,
  }) : super(key: key);

  @override
  _AnimatedFloatingButtonsState createState() => _AnimatedFloatingButtonsState();
}

class _AnimatedFloatingButtonsState extends State<AnimatedFloatingButtons> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _isExpanded = !_isExpanded);
    _isExpanded ? _controller.forward() : _controller.reverse();
  }

  void _onPressedItem(int index) {
    widget.onPressedCallBack(index);
    _toggle();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _isExpanded ? widget.iconItems.length * 76 : 0.0,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.iconItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                      height: kToolbarHeight,
                      width: kToolbarHeight,
                      child: FloatingActionButton(
                          onPressed: () => _onPressedItem(index),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Icon(widget.iconItems[index], color: Colors.white))),
                );
              },
            ),
          ),
          // SizedBox(height: 16),
          SizedBox(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                    angle: _animation.value * 0.75 * 2 * 3.1415,
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: _toggle,
                        icon: Icon(_isExpanded ? Icons.close : widget.primaryButtonIcon)));
              },
            ),
          ),
        ],
      ),
    );
  }
}
