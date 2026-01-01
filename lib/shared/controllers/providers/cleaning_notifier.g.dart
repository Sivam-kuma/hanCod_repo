// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleaning_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CleaningNotifier)
final cleaningProvider = CleaningNotifierProvider._();

final class CleaningNotifierProvider
    extends $NotifierProvider<CleaningNotifier, CleaningState> {
  CleaningNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cleaningProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cleaningNotifierHash();

  @$internal
  @override
  CleaningNotifier create() => CleaningNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CleaningState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CleaningState>(value),
    );
  }
}

String _$cleaningNotifierHash() => r'4e2c7576818c0f5c98723dbfc144e12d7ad7f58b';

abstract class _$CleaningNotifier extends $Notifier<CleaningState> {
  CleaningState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CleaningState, CleaningState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CleaningState, CleaningState>,
              CleaningState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
