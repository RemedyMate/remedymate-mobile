import 'package:flutter/material.dart';

import '../../../../core/l10n/arb/app_localizations.dart';

class OfflineMode extends StatelessWidget {
  const OfflineMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Row(
      children: [
        const Icon(Icons.warning, color: Colors.black),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            l10n.offlineMessage,
            style: const TextStyle(color: Color(0xFF92400E)),
          ),
        ),
      ],
    );
  }
}