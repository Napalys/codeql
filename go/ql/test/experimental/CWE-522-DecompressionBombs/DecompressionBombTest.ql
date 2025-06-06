import go
import semmle.go.dataflow.ExternalFlow
import ModelValidation
import utils.test.InlineExpectationsTest
import experimental.frameworks.DecompressionBombs::DecompressionBomb

module TestDecompressionBombs implements TestSig {
  string getARelevantTag() { result = "hasValueFlow" }

  predicate hasActualResult(Location location, string element, string tag, string value) {
    tag = "hasValueFlow" and
    exists(DataFlow::Node sink | Flow::flowTo(sink) |
      sink.getLocation() = location and
      element = sink.toString() and
      value = "\"" + sink.toString() + "\""
    )
  }
}

import MakeTest<TestDecompressionBombs>
