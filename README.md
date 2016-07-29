# Detected Double Release Error filter plugin for Embulk

How the error occurs?

```
[embulk-filter-detected_double_release_error] embulk --version                                                                                                                            (git)[master|… 10]
embulk 0.8.9

[embulk-filter-detected_double_release_error] embulk bundle install --path vendor/bundle                                                                                                  (git)[master|… 10]
2016-07-29 09:32:59.639 +0900: Embulk v0.8.9
Warning: the running version of Bundler is older than the version that created the lockfile. We suggest you upgrade to the latest version of Bundler by running `gem install bundler`.
Fetching gem metadata from https://rubygems.org/...............
Fetching version metadata from https://rubygems.org/..
Resolving dependencies...
Installing rake 11.2.2
Using bundler 1.10.6
Installing liquid 3.0.6
Installing msgpack 0.7.6
Installing rjack-icu 4.54.1.1
Installing embulk 0.8.11
Using embulk-filter-detected_double_release_error 0.1.0 from source at .
Bundle complete! 4 Gemfile dependencies, 7 gems now installed.
Bundled gems are installed into ./vendor/bundle.

[embulk-filter-detected_double_release_error] embulk run example/config.yml -b .                                                                                                          (git)[master|… 10]
2016-07-29 09:33:47.988 +0900: Embulk v0.8.9
2016-07-29 09:33:50.170 +0900 [INFO] (0001:transaction): Loaded plugin embulk-filter-detected_double_release_error (0.1.0)
2016-07-29 09:33:50.232 +0900 [INFO] (0001:transaction): Listing local files at directory 'example' filtering filename by prefix 'data.tsv'
2016-07-29 09:33:50.245 +0900 [INFO] (0001:transaction): Loading files [example/data.tsv]
2016-07-29 09:33:50.429 +0900 [INFO] (0001:transaction): Using local thread executor with max_threads=8 / output tasks 4 = input tasks 1 * 4
2016-07-29 09:33:50.450 +0900 [INFO] (0001:transaction): {done:  0 / 1, running: 0}
org.embulk.exec.PooledBufferAllocator$BufferDoubleReleasedException: Detected double release() call of a buffer
        at org.embulk.exec.PooledBufferAllocator$NettyByteBufBuffer.release(PooledBufferAllocator.java:55)
        at org.embulk.spi.Page.release(Page.java:63)
        at org.embulk.exec.LocalExecutorPlugin$ScatterTransactionalPageOutput$OutputWorker.call(LocalExecutorPlugin.java:403)
        at org.embulk.exec.LocalExecutorPlugin$ScatterTransactionalPageOutput$OutputWorker.call(LocalExecutorPlugin.java:318)
        at java.util.concurrent.FutureTask.run(FutureTask.java:266)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)
        at java.lang.Thread.run(Thread.java:745)
Caused by: org.embulk.exec.PooledBufferAllocator$BufferReleasedBeforeAt
        at org.embulk.exec.PooledBufferAllocator$NettyByteBufBuffer.release(PooledBufferAllocator.java:60)
        at org.embulk.spi.PageReader.close(PageReader.java:166)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke(Method.java:498)
        at org.jruby.javasupport.JavaMethod.invokeDirectWithExceptionHandling(JavaMethod.java:437)
        at org.jruby.javasupport.JavaMethod.invokeDirect(JavaMethod.java:301)
        at org.jruby.java.invokers.InstanceMethodInvoker.call(InstanceMethodInvoker.java:35)
        at org.jruby.runtime.callsite.CachingCallSite.cacheAndCall(CachingCallSite.java:293)
        at org.jruby.runtime.callsite.CachingCallSite.call(CachingCallSite.java:131)
        at org.jruby.ir.interpreter.InterpreterEngine.processCall(InterpreterEngine.java:332)
        at org.jruby.ir.interpreter.StartupInterpreterEngine.interpret(StartupInterpreterEngine.java:77)
        at org.jruby.internal.runtime.methods.MixedModeIRMethod.INTERPRET_METHOD(MixedModeIRMethod.java:140)
        at org.jruby.internal.runtime.methods.MixedModeIRMethod.call(MixedModeIRMethod.java:126)
        at org.jruby.runtime.callsite.CachingCallSite.cacheAndCall(CachingCallSite.java:273)
        at org.jruby.runtime.callsite.CachingCallSite.callBlock(CachingCallSite.java:79)
        at org.jruby.runtime.callsite.CachingCallSite.call(CachingCallSite.java:83)
        at org.jruby.ir.instructions.CallBase.interpret(CallBase.java:414)
        at org.jruby.ir.interpreter.InterpreterEngine.processCall(InterpreterEngine.java:348)
        at org.jruby.ir.interpreter.StartupInterpreterEngine.interpret(StartupInterpreterEngine.java:77)
        at org.jruby.ir.interpreter.InterpreterEngine.interpret(InterpreterEngine.java:86)
        at org.jruby.internal.runtime.methods.MixedModeIRMethod.INTERPRET_METHOD(MixedModeIRMethod.java:210)
        at org.jruby.internal.runtime.methods.MixedModeIRMethod.call(MixedModeIRMethod.java:196)
        at org.jruby.internal.runtime.methods.DynamicMethod.call(DynamicMethod.java:197)
        at org.jruby.runtime.callsite.CachingCallSite.cacheAndCall(CachingCallSite.java:313)
        at org.jruby.runtime.callsite.CachingCallSite.call(CachingCallSite.java:163)
        at org.jruby.ir.interpreter.InterpreterEngine.processCall(InterpreterEngine.java:316)
        at org.jruby.ir.interpreter.StartupInterpreterEngine.interpret(StartupInterpreterEngine.java:77)
        at org.jruby.internal.runtime.methods.MixedModeIRMethod.INTERPRET_METHOD(MixedModeIRMethod.java:140)
        at org.jruby.internal.runtime.methods.MixedModeIRMethod.call(MixedModeIRMethod.java:126)
        at Embulk$$FilterPlugin$$JavaAdapter$$OutputAdapter_665162986.add(Embulk$$FilterPlugin$$JavaAdapter$$OutputAdapter_665162986.gen:13)
        at org.embulk.exec.LocalExecutorPlugin$ScatterTransactionalPageOutput$OutputWorker.call(LocalExecutorPlugin.java:393)
        ... 5 more
2016-07-29 09:33:50.688 +0900 [INFO] (0001:transaction): {done:  1 / 1, running: 0}
org.embulk.exec.PartialExecutionException: java.lang.IllegalArgumentException: Self-suppression not permitted
        at org.embulk.exec.BulkLoader$LoaderState.buildPartialExecuteException(org/embulk/exec/BulkLoader.java:363)
        at org.embulk.exec.BulkLoader.doRun(org/embulk/exec/BulkLoader.java:572)
        at org.embulk.exec.BulkLoader.access$000(org/embulk/exec/BulkLoader.java:33)
        at org.embulk.exec.BulkLoader$1.run(org/embulk/exec/BulkLoader.java:374)
        at org.embulk.exec.BulkLoader$1.run(org/embulk/exec/BulkLoader.java:370)
        at org.embulk.spi.Exec.doWith(org/embulk/spi/Exec.java:25)
        at org.embulk.exec.BulkLoader.run(org/embulk/exec/BulkLoader.java:370)
        at org.embulk.EmbulkEmbed.run(org/embulk/EmbulkEmbed.java:180)
        at java.lang.reflect.Method.invoke(java/lang/reflect/Method.java:498)
        at RUBY.run(uri:classloader:/embulk/runner.rb:84)
        at RUBY.run(uri:classloader:/embulk/command/embulk_run.rb:306)
        at RUBY.<top>(uri:classloader:/embulk/command/embulk_main.rb:2)
        at org.jruby.RubyKernel.require(org/jruby/RubyKernel.java:937)
        at usr.local.Cellar.embulk.$0_dot_8_dot_8.libexec.bin.embulk.embulk.command.embulk_bundle.<top>(file:/usr/local/Cellar/embulk/0.8.8/libexec/bin/embulk!/embulk/command/embulk_bundle.rb:30)
        at java.lang.invoke.MethodHandle.invokeWithArguments(java/lang/invoke/MethodHandle.java:627)
        at org.embulk.cli.Main.main(org/embulk/cli/Main.java:23)
Caused by: java.lang.IllegalArgumentException: Self-suppression not permitted
        at java.lang.Throwable.addSuppressed(java/lang/Throwable.java:1043)
        at org.embulk.standards.CsvParserPlugin.run(org/embulk/standards/CsvParserPlugin.java:394)
        at org.embulk.spi.FileInputRunner.run(org/embulk/spi/FileInputRunner.java:154)
        at org.embulk.exec.LocalExecutorPlugin$ScatterExecutor.runInputTask(org/embulk/exec/LocalExecutorPlugin.java:294)
        at org.embulk.exec.LocalExecutorPlugin$ScatterExecutor.access$000(org/embulk/exec/LocalExecutorPlugin.java:212)
        at org.embulk.exec.LocalExecutorPlugin$ScatterExecutor$1.call(org/embulk/exec/LocalExecutorPlugin.java:257)
        at org.embulk.exec.LocalExecutorPlugin$ScatterExecutor$1.call(org/embulk/exec/LocalExecutorPlugin.java:253)
        at java.util.concurrent.FutureTask.run(java/util/concurrent/FutureTask.java:266)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(java/util/concurrent/ThreadPoolExecutor.java:1142)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(java/util/concurrent/ThreadPoolExecutor.java:617)
        at java.lang.Thread.run(java/lang/Thread.java:745)
        Suppressed: org.jruby.exceptions.RaiseException: (StandardError) error
                at RUBY.block in add(/Users/takahiro.nakayama/work/sandbox/embulk-filter-detected_double_release_error/lib/embulk/filter/detected_double_release_error.rb:32)
                at RUBY.each(uri:classloader:/embulk/page.rb:22)
                at RUBY.add(/Users/takahiro.nakayama/work/sandbox/embulk-filter-detected_double_release_error/lib/embulk/filter/detected_double_release_error.rb:30)
                at RUBY.add(uri:classloader:/embulk/filter_plugin.rb:78)
        [CIRCULAR REFERENCE:org.jruby.exceptions.RaiseException: (StandardError) error]
        [CIRCULAR REFERENCE:org.jruby.exceptions.RaiseException: (StandardError) error]

Error: java.lang.IllegalArgumentException: Self-suppression not permitted
```
