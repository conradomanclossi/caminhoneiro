["build_web_compilers:entrypoint on web/main.dart",["","AssetNotFoundException: web_app|web/main.ddc.js","#0      bootstrapDdc (package:build_web_compilers/src/dev_compiler_bootstrap.dart:122:34)\n<asynchronous suspension>\n#1      WebEntrypointBuilder.build (package:build_web_compilers/src/web_entrypoint_builder.dart:101:15)\n<asynchronous suspension>\n#2      runBuilder.buildForInput (package:build/src/generate/run_builder.dart:45:21)\n<asynchronous suspension>\n#3      MappedListIterable.elementAt (dart:_internal/iterable.dart:414:29)\n#4      ListIterator.moveNext (dart:_internal/iterable.dart:343:26)\n#5      Future.wait (dart:async/future.dart:393:26)\n#6      runBuilder.<anonymous closure> (package:build/src/generate/run_builder.dart:51:36)\n#7      _rootRun (dart:async/zone.dart:1124:13)\n#8      _CustomZone.run (dart:async/zone.dart:1021:19)\n#9      _runZoned (dart:async/zone.dart:1516:10)\n#10     runZoned (dart:async/zone.dart:1500:12)\n#11     scopeLogAsync (package:build/src/builder/logging.dart:22:3)\n#12     runBuilder (package:build/src/generate/run_builder.dart:51:9)\n<asynchronous suspension>\n#13     _SingleBuild._runForInput.<anonymous closure>.<anonymous closure>.<anonymous closure> (package:build_runner_core/src/generate/build_impl.dart:471:19)\n#14     _NoOpBuilderActionTracker.trackStage (package:build_runner_core/src/generate/performance_tracker.dart:300:15)\n#15     _SingleBuild._runForInput.<anonymous closure>.<anonymous closure> (package:build_runner_core/src/generate/build_impl.dart:469:23)\n<asynchronous suspension>\n#16     NoOpTimeTracker.track (package:timing/src/timing.dart:222:44)\n#17     _SingleBuild._runForInput.<anonymous closure> (package:build_runner_core/src/generate/build_impl.dart:428:22)\n#18     Pool.withResource (package:pool/pool.dart:127:28)\n<asynchronous suspension>\n#19     _SingleBuild._runForInput (package:build_runner_core/src/generate/build_impl.dart:424:17)\n#20     _SingleBuild._runBuilder.<anonymous closure> (package:build_runner_core/src/generate/build_impl.dart:374:38)\n#21     MappedIterator.moveNext (dart:_internal/iterable.dart:392:18)\n#22     Future.wait (dart:async/future.dart:393:26)\n#23     _SingleBuild._runBuilder (package:build_runner_core/src/generate/build_impl.dart:373:36)\n<asynchronous suspension>\n#24     _SingleBuild._runPhases.<anonymous closure>.<anonymous closure> (package:build_runner_core/src/generate/build_impl.dart:320:20)\n<asynchronous suspension>\n#25     _NoOpBuildPerformanceTracker.trackBuildPhase (package:build_runner_core/src/generate/performance_tracker.dart:184:15)\n#26     _SingleBuild._runPhases.<anonymous closure> (package:build_runner_core/src/generate/build_impl.dart:316:47)\n<asynchronous suspension>\n#27     NoOpTimeTracker.track (package:timing/src/timing.dart:222:44)\n#28     _SingleBuild._runPhases (package:build_runner_core/src/generate/build_impl.dart:310:32)\n#29     logTimedAsync (package:build_runner_core/src/logging/logging.dart:25:30)\n<asynchronous suspension>\n#30     _SingleBuild._safeBuild.<anonymous closure> (package:build_runner_core/src/generate/build_impl.dart:267:26)\n<asynchronous suspension>\n#31     _rootRun (dart:async/zone.dart:1124:13)\n#32     _CustomZone.run (dart:async/zone.dart:1021:19)\n#33     _runZoned (dart:async/zone.dart:1516:10)\n#34     runZoned (dart:async/zone.dart:1500:12)\n#35     _SingleBuild._safeBuild (package:build_runner_core/src/generate/build_impl.dart:262:5)\n#36     _SingleBuild.run (package:build_runner_core/src/generate/build_impl.dart:209:24)\n<asynchronous suspension>\n#37     BuildImpl.run (package:build_runner_core/src/generate/build_impl.dart:97:42)\n#38     BuildRunnerDaemonBuilder.build (package:build_runner/src/daemon/daemon_builder.dart:99:35)\n<asynchronous suspension>\n#39     Server._build.<anonymous closure> (package:build_daemon/src/server.dart:122:25)\n#40     Pool.withResource (package:pool/pool.dart:127:28)\n<asynchronous suspension>\n#41     Server._build (package:build_daemon/src/server.dart:119:13)\n#42     Server._handleChanges.<anonymous closure> (package:build_daemon/src/server.dart:148:13)\n<asynchronous suspension>\n#43     _asyncMapThen.<anonymous closure> (package:stream_transform/src/async_map_buffer.dart:76:16)\n#44     _StreamTransformer.bind.<anonymous closure>.<anonymous closure> (package:stream_transform/src/from_handlers.dart:59:47)\n#45     _RootZone.runUnaryGuarded (dart:async/zone.dart:1314:10)\n#46     _BufferingStreamSubscription._sendData (dart:async/stream_impl.dart:336:11)\n#47     _BufferingStreamSubscription._add (dart:async/stream_impl.dart:263:7)\n#48     _SyncStreamController._sendData (dart:async/stream_controller.dart:764:19)\n#49     _StreamController._add (dart:async/stream_controller.dart:640:7)\n#50     _StreamController.add (dart:async/stream_controller.dart:586:5)\n#51     AggregateSample.bind.emit (package:stream_transform/src/aggregate_sample.dart:36:18)\n#52     AggregateSample.bind.onValue (package:stream_transform/src/aggregate_sample.dart:44:35)\n#53     _RootZone.runUnaryGuarded (dart:async/zone.dart:1314:10)\n#54     _BufferingStreamSubscription._sendData (dart:async/stream_impl.dart:336:11)\n#55     _BufferingStreamSubscription._add (dart:async/stream_impl.dart:263:7)\n#56     _ForwardingStreamSubscription._add (dart:async/stream_pipe.dart:132:11)\n#57     _MapStream._handleData (dart:async/stream_pipe.dart:232:10)\n#58     _ForwardingStreamSubscription._handleData (dart:async/stream_pipe.dart:164:13)\n#59     _RootZone.runUnaryGuarded (dart:async/zone.dart:1314:10)\n#60     _BufferingStreamSubscription._sendData (dart:async/stream_impl.dart:336:11)\n#61     _BufferingStreamSubscription._add (dart:async/stream_impl.dart:263:7)\n#62     _SyncStreamController._sendData (dart:async/stream_controller.dart:764:19)\n#63     _StreamController._add (dart:async/stream_controller.dart:640:7)\n#64     _StreamController.add (dart:async/stream_controller.dart:586:5)\n#65     _debounceAggregate.<anonymous closure>.<anonymous closure> (package:stream_transform/src/debounce.dart:43:12)\n#66     Timer._createTimer.<anonymous closure> (dart:async-patch/timer_patch.dart:21:15)\n#67     _Timer._runTimers (dart:isolate-patch/timer_impl.dart:382:19)\n#68     _Timer._handleMessage (dart:isolate-patch/timer_impl.dart:416:5)\n#69     _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:172:12)\n"]]