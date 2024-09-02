import 'package:flutter/material.dart';

/// A customizable dialogue box widget that displays a grid of cards and a location URL.
///
/// The dialogue box has a title, a location URL, and a grid of cards. The location URL is
// generated based on the provided [locationData]. If [locationData] is null, the location
/// URL will be 'Location not available'.
///
/// The grid of cards is customizable, with options to adjust the number of columns, card
/// height, and card spacing.
///
/// Example usage:
///
/// ```dart
/// DialogueBox(
///   locationData: LocationData(latitude: 37.7749, longitude: -122.4194),
/// )
/// ```
class DialogueBox extends StatelessWidget {
  /// The location data used to generate the location URL.
  // final LocationData? locationData;

  /// Creates a new [DialogueBox] widget.
  // const DialogueBox({super.key, this.locationData});

  @override
  Widget build(BuildContext context) {
    /// The location URL generated based on the provided [locationData].
    // final String locationUrl = locationData != null
    //     ? 'https://www.google.com/maps?q=${locationData!.latitude},${locationData!.longitude}'
    //     : 'Location not available';

    return AlertDialog(
      /// The title of the dialogue box.
      title: const Text(
        'Instant Help!',
        style: TextStyle(
          fontSize: 24, // Adjust title text size if needed
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// The location URL displayed in the dialogue box.
          Text(
            // 'Location: $locationUrl',
            'hello',
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 18, // Adjust text size
              fontWeight: FontWeight.w500, // Adjust text weight if needed
            ),
          ),
          const SizedBox(height: 10),

          /// The grid of cards displayed in the dialogue box.
          SizedBox(
            width: double.maxFinite,
            height: 300, // Adjust height as needed
            child: GridView.builder(
              /// The grid delegate used to customize the grid layout.
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),

              /// The total number of cards in the grid.
              itemCount: 20,

              /// The builder function used to create each card in the grid.
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // Add your onTap logic here
                    print('Card ${index + 1} tapped');
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Card ${index + 1}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      actions: <Widget>[
        /// The close button used to dismiss the dialogue box.
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
        ),
      ],
    );
  }
}
