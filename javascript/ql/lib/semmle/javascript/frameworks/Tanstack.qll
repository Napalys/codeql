/**
 * Provides classes and predicates modeling the Tanstack/react-query library.
 */

private import javascript

/**
 * An additional flow step that propagates data from the return value of the query function,
 * defined in a useQuery call from the '@tanstack/react-query' module, to the 'data' property.
 */
private class TanstackStep extends DataFlow::AdditionalFlowStep {
  override predicate step(DataFlow::Node node1, DataFlow::Node node2) {
    exists(API::CallNode useQuery |
      (
        useQuery = useQueryCall()
        or
        useQuery = useQueryCallVue()
      ) and
      node1 = useQuery.getParameter(0).getMember("queryFn").getReturn().getPromised().asSink() and
      node2 = useQuery.getReturn().getMember("data").asSource()
    )
  }
}

/**
 * Retrieves a call node representing a useQuery invocation from the '@tanstack/react-query' module.
 */
private API::CallNode useQueryCall() {
  result = API::moduleImport("@tanstack/react-query").getMember("useQuery").getACall()
}

private API::CallNode useQueryCallVue() {
  result = API::moduleImport("@tanstack/vue-query").getMember("useQuery").getACall()
}
