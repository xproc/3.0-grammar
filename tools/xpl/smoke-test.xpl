<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
                name="main" version="3.0"
                xml:id="main">
  <!-- This pipeline does nothing, it's just a smoke test for
       the RELAX NG validator. -->
  <p:input port="source"/>
  <p:output port="result"/>
  <p:identity xml:space="preserve">
    <p:with-input port="source" pipe="source"/>
  </p:identity>
</p:declare-step>
