import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/height_record.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import '../utils/design_tokens.dart';
import '../utils/haptics.dart';
import '../widgets/measure_fields.dart';

/// The weekly measurement, as a page that has to be answered: it opens over
/// the app once a week has passed since the last reading and cannot be
/// swiped or backed away. The reading can be put off by one day, once; the
/// day after, only saving a height closes it.
class MeasureGateScreen extends StatefulWidget {
  const MeasureGateScreen({super.key});

  @override
  State<MeasureGateScreen> createState() => _MeasureGateScreenState();
}

class _MeasureGateScreenState extends State<MeasureGateScreen> {
  MeasureFields? _input;
  bool _invalid = false;

  void _save(AppProvider provider) {
    final height = _input?.value;
    if (height == null || height <= 50 || height >= 250) {
      Haptics.tap();
      setState(() => _invalid = true);
      return;
    }
    FocusScope.of(context).unfocus();
    final profile = provider.profile;
    provider.addHeightRecord(
      HeightRecord(
        date: DateTime.now().toIso8601String().substring(0, 10),
        height: height,
      ),
    );
    if (profile != null) {
      provider.updateProfile(profile.copyWith(currentHeight: height));
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.read<AppProvider>();
    _input ??= MeasureFields.height(
      provider.units,
      provider.profile?.currentHeight ?? provider.latestHeight,
    );
    final days = provider.daysSinceMeasurement;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: BtColors.page,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, c) => SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: c.maxHeight - 44),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.lime.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          CupertinoIcons.resize_v,
                          color: AppColors.lime,
                          size: 26,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(l.mgTitle, style: BtType.screenTitle),
                      const SizedBox(height: 8),
                      Text(
                        l.mgBody(days),
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.4,
                          color: BtColors.textSoft,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _input!.build(
                        (controller, suffix, _) => TextField(
                          controller: controller,
                          onChanged: (_) {
                            if (_invalid) setState(() => _invalid = false);
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -1,
                          ),
                          textAlign: TextAlign.center,
                          cursorColor: AppColors.lime,
                          decoration: InputDecoration(
                            suffixText: suffix,
                            suffixStyle: TextStyle(
                              fontSize: 16,
                              color: BtColors.textMute,
                            ),
                            filled: true,
                            fillColor: BtColors.card,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _invalid
                                    ? AppColors.error
                                    : BtColors.stroke,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: _invalid
                                    ? AppColors.error
                                    : AppColors.lime,
                                width: 1.5,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      for (final tip in [l.mgTip1, l.mgTip2, l.mgTip3])
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Icon(
                                  CupertinoIcons.checkmark_alt,
                                  size: 17,
                                  color: AppColors.lime,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  tip,
                                  style: TextStyle(
                                    fontSize: 14.5,
                                    height: 1.35,
                                    color: BtColors.textSoft,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      const Spacer(),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(16),
                          onPressed: () => _save(provider),
                          child: Text(
                            l.save,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      if (provider.canPostponeMeasure) ...[
                        const SizedBox(height: 4),
                        Center(
                          child: CupertinoButton(
                            onPressed: () {
                              Haptics.tap();
                              provider.postponeMeasure();
                              Navigator.pop(context);
                            },
                            child: Text(
                              l.mgLater,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: BtColors.textMute,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
