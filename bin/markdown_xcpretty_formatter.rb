require 'xcpretty'

class Markdown < XCPretty::Simple

  def format_test_case_name(name)
    separator = " ⇒ "
    name = name.gsub('Don_t', "Don't")
    name = name.gsub(/(\d+)_(\d+)/, '\1.\2')
    name = name.gsub('____', separator)
    name = name.gsub('__', separator)
    name = name.gsub('_', ' ')
    name
  end

  def format_test_run_started(name)
    %{

# Started: #{name}

| Test/Suite | |
|:-----|:-----|}
  end

  def format_test_suite_started(name)
    if name != "All tests" # We don't consider "All tests" a suite.
      text = <<~EOD
      | | |
      | **#{name}** | |}
      EOD
      text.chomp
    else
      ""
    end
  end

  def format_passing_test(suite, test_case, time)
    "| #{format_test_case_name(test_case)} (#{time}) |  ✓  |"
  end

  def format_test_run_finished(name, time)
    ""
  end

  def format_test_summary(executed_message, failures_per_suite)
    ""
  end

  def format_failing_test(suite, test_case, reason, file_path)
    %{| #{format_test_case_name(test_case)} | ✗ |
| #{file_path}     | |
| Reason: #{reason}| |}
  end

  private

  def format_duration(duration)
    "%.2f seconds" % duration
  end
end

Markdown
