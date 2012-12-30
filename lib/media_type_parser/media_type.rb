# encoding: ASCII-8BIT

module MediaTypeParser
  module Generated
    module MediaType
      include Treetop::Runtime

      def root
        @root ||= :media_type
      end

      module MediaType0
        def ows1
          elements[0]
        end

        def ows2
          elements[2]
        end

        def parameter
          elements[3]
        end
      end

      module MediaType1
        def type
          elements[0]
        end

        def subtype
          elements[2]
        end

        def param_clauses
          elements[3]
        end
      end

      module MediaType2
        def value
          [
            type.value,
            subtype.value,
            param_clauses.elements.collect { |clause| clause.parameter.value }
          ]
        end
      end

      def _nt_media_type
        start_index = index
        if node_cache[:media_type].has_key?(index)
          cached = node_cache[:media_type][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_type
        s0 << r1
        if r1
          if has_terminal?("/", false, index)
            r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("/")
            r2 = nil
          end
          s0 << r2
          if r2
            r3 = _nt_subtype
            s0 << r3
            if r3
              s4, i4 = [], index
              loop do
                i5, s5 = index, []
                r6 = _nt_ows
                s5 << r6
                if r6
                  if has_terminal?(";", false, index)
                    r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure(";")
                    r7 = nil
                  end
                  s5 << r7
                  if r7
                    r8 = _nt_ows
                    s5 << r8
                    if r8
                      r9 = _nt_parameter
                      s5 << r9
                    end
                  end
                end
                if s5.last
                  r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
                  r5.extend(MediaType0)
                else
                  @index = i5
                  r5 = nil
                end
                if r5
                  s4 << r5
                else
                  break
                end
              end
              r4 = instantiate_node(SyntaxNode,input, i4...index, s4)
              s0 << r4
            end
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(MediaType1)
          r0.extend(MediaType2)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:media_type][start_index] = r0

        r0
      end

      def _nt_type
        start_index = index
        if node_cache[:type].has_key?(index)
          cached = node_cache[:type][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        r0 = _nt_token

        node_cache[:type][start_index] = r0

        r0
      end

      def _nt_subtype
        start_index = index
        if node_cache[:subtype].has_key?(index)
          cached = node_cache[:subtype][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        r0 = _nt_token

        node_cache[:subtype][start_index] = r0

        r0
      end

      module Parameter0
        def attribute
          elements[0]
        end

        def param_value
          elements[2]
        end
      end

      module Parameter1
        def value
          [ attribute.value, param_value.value ]
        end
      end

      def _nt_parameter
        start_index = index
        if node_cache[:parameter].has_key?(index)
          cached = node_cache[:parameter][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_attribute
        s0 << r1
        if r1
          if has_terminal?("=", false, index)
            r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("=")
            r2 = nil
          end
          s0 << r2
          if r2
            r3 = _nt_param_value
            s0 << r3
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Parameter0)
          r0.extend(Parameter1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:parameter][start_index] = r0

        r0
      end

      def _nt_attribute
        start_index = index
        if node_cache[:attribute].has_key?(index)
          cached = node_cache[:attribute][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        r0 = _nt_token

        node_cache[:attribute][start_index] = r0

        r0
      end

      def _nt_param_value
        start_index = index
        if node_cache[:param_value].has_key?(index)
          cached = node_cache[:param_value][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        r1 = _nt_token
        if r1
          r0 = r1
        else
          r2 = _nt_quoted_string
          if r2
            r0 = r2
          else
            @index = i0
            r0 = nil
          end
        end

        node_cache[:param_value][start_index] = r0

        r0
      end

      module Token0
        def value
          text_value
        end
      end

      def _nt_token
        start_index = index
        if node_cache[:token].has_key?(index)
          cached = node_cache[:token][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          r1 = _nt_tchar
          if r1
            s0 << r1
          else
            break
          end
        end
        if s0.empty?
          @index = i0
          r0 = nil
        else
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Token0)
        end

        node_cache[:token][start_index] = r0

        r0
      end

      module QuotedString0
        def dquote1
          elements[0]
        end

        def chars
          elements[1]
        end

        def dquote2
          elements[2]
        end
      end

      module QuotedString1
        def value
          chars.elements.collect do |char|
            char.terminal? ? char.text_value : char.value
          end.join
        end
      end

      def _nt_quoted_string
        start_index = index
        if node_cache[:quoted_string].has_key?(index)
          cached = node_cache[:quoted_string][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_dquote
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            i3 = index
            r4 = _nt_qdtext
            if r4
              r3 = r4
            else
              r5 = _nt_quoted_pair
              if r5
                r3 = r5
              else
                @index = i3
                r3 = nil
              end
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
          if r2
            r6 = _nt_dquote
            s0 << r6
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(QuotedString0)
          r0.extend(QuotedString1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:quoted_string][start_index] = r0

        r0
      end

      def _nt_qdtext
        start_index = index
        if node_cache[:qdtext].has_key?(index)
          cached = node_cache[:qdtext][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        r1 = _nt_sp
        if r1
          r0 = r1
        else
          r2 = _nt_htab
          if r2
            r0 = r2
          else
            if has_terminal?("\x21", false, index)
              r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("\x21")
              r3 = nil
            end
            if r3
              r0 = r3
            else
              if has_terminal?('\G[\\x23-\\x5b]', true, index)
                r4 = true
                @index += 1
              else
                r4 = nil
              end
              if r4
                r0 = r4
              else
                if has_terminal?('\G[\\x5d-\\x7e]', true, index)
                  r5 = true
                  @index += 1
                else
                  r5 = nil
                end
                if r5
                  r0 = r5
                else
                  r6 = _nt_obs_text
                  if r6
                    r0 = r6
                  else
                    @index = i0
                    r0 = nil
                  end
                end
              end
            end
          end
        end

        node_cache[:qdtext][start_index] = r0

        r0
      end

      module QuotedPair0
      end

      module QuotedPair1
        def value
          elements[ 1 ].text_value
        end
      end

      def _nt_quoted_pair
        start_index = index
        if node_cache[:quoted_pair].has_key?(index)
          cached = node_cache[:quoted_pair][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        if has_terminal?("\\", false, index)
          r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("\\")
          r1 = nil
        end
        s0 << r1
        if r1
          i2 = index
          r3 = _nt_wsp
          if r3
            r2 = r3
          else
            r4 = _nt_vchar
            if r4
              r2 = r4
            else
              r5 = _nt_obs_text
              if r5
                r2 = r5
              else
                @index = i2
                r2 = nil
              end
            end
          end
          s0 << r2
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(QuotedPair0)
          r0.extend(QuotedPair1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:quoted_pair][start_index] = r0

        r0
      end

      def _nt_tchar
        start_index = index
        if node_cache[:tchar].has_key?(index)
          cached = node_cache[:tchar][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        if has_terminal?("!", false, index)
          r1 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("!")
          r1 = nil
        end
        if r1
          r0 = r1
        else
          if has_terminal?("#", false, index)
            r2 = instantiate_node(SyntaxNode,input, index...(index + 1))
            @index += 1
          else
            terminal_parse_failure("#")
            r2 = nil
          end
          if r2
            r0 = r2
          else
            if has_terminal?("$", false, index)
              r3 = instantiate_node(SyntaxNode,input, index...(index + 1))
              @index += 1
            else
              terminal_parse_failure("$")
              r3 = nil
            end
            if r3
              r0 = r3
            else
              if has_terminal?("%", false, index)
                r4 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure("%")
                r4 = nil
              end
              if r4
                r0 = r4
              else
                if has_terminal?("&", false, index)
                  r5 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure("&")
                  r5 = nil
                end
                if r5
                  r0 = r5
                else
                  if has_terminal?("'", false, index)
                    r6 = instantiate_node(SyntaxNode,input, index...(index + 1))
                    @index += 1
                  else
                    terminal_parse_failure("'")
                    r6 = nil
                  end
                  if r6
                    r0 = r6
                  else
                    if has_terminal?("*", false, index)
                      r7 = instantiate_node(SyntaxNode,input, index...(index + 1))
                      @index += 1
                    else
                      terminal_parse_failure("*")
                      r7 = nil
                    end
                    if r7
                      r0 = r7
                    else
                      if has_terminal?("+", false, index)
                        r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
                        @index += 1
                      else
                        terminal_parse_failure("+")
                        r8 = nil
                      end
                      if r8
                        r0 = r8
                      else
                        if has_terminal?("-", false, index)
                          r9 = instantiate_node(SyntaxNode,input, index...(index + 1))
                          @index += 1
                        else
                          terminal_parse_failure("-")
                          r9 = nil
                        end
                        if r9
                          r0 = r9
                        else
                          if has_terminal?(".", false, index)
                            r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                            @index += 1
                          else
                            terminal_parse_failure(".")
                            r10 = nil
                          end
                          if r10
                            r0 = r10
                          else
                            if has_terminal?("^", false, index)
                              r11 = instantiate_node(SyntaxNode,input, index...(index + 1))
                              @index += 1
                            else
                              terminal_parse_failure("^")
                              r11 = nil
                            end
                            if r11
                              r0 = r11
                            else
                              if has_terminal?("_", false, index)
                                r12 = instantiate_node(SyntaxNode,input, index...(index + 1))
                                @index += 1
                              else
                                terminal_parse_failure("_")
                                r12 = nil
                              end
                              if r12
                                r0 = r12
                              else
                                if has_terminal?("`", false, index)
                                  r13 = instantiate_node(SyntaxNode,input, index...(index + 1))
                                  @index += 1
                                else
                                  terminal_parse_failure("`")
                                  r13 = nil
                                end
                                if r13
                                  r0 = r13
                                else
                                  if has_terminal?("|", false, index)
                                    r14 = instantiate_node(SyntaxNode,input, index...(index + 1))
                                    @index += 1
                                  else
                                    terminal_parse_failure("|")
                                    r14 = nil
                                  end
                                  if r14
                                    r0 = r14
                                  else
                                    if has_terminal?("~", false, index)
                                      r15 = instantiate_node(SyntaxNode,input, index...(index + 1))
                                      @index += 1
                                    else
                                      terminal_parse_failure("~")
                                      r15 = nil
                                    end
                                    if r15
                                      r0 = r15
                                    else
                                      r16 = _nt_digit
                                      if r16
                                        r0 = r16
                                      else
                                        r17 = _nt_alpha
                                        if r17
                                          r0 = r17
                                        else
                                          @index = i0
                                          r0 = nil
                                        end
                                      end
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end

        node_cache[:tchar][start_index] = r0

        r0
      end

      def _nt_ows
        start_index = index
        if node_cache[:ows].has_key?(index)
          cached = node_cache[:ows][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          i1 = index
          r2 = _nt_sp
          if r2
            r1 = r2
          else
            r3 = _nt_htab
            if r3
              r1 = r3
            else
              @index = i1
              r1 = nil
            end
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

        node_cache[:ows][start_index] = r0

        r0
      end

      def _nt_obs_text
        start_index = index
        if node_cache[:obs_text].has_key?(index)
          cached = node_cache[:obs_text][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?('\G[\\x80-\\xff]', true, index)
          r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r0 = nil
        end

        node_cache[:obs_text][start_index] = r0

        r0
      end

      def _nt_digit
        start_index = index
        if node_cache[:digit].has_key?(index)
          cached = node_cache[:digit][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?('\G[0-9]', true, index)
          r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r0 = nil
        end

        node_cache[:digit][start_index] = r0

        r0
      end

      def _nt_alpha
        start_index = index
        if node_cache[:alpha].has_key?(index)
          cached = node_cache[:alpha][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        if has_terminal?('\G[a-z]', true, index)
          r1 = true
          @index += 1
        else
          r1 = nil
        end
        if r1
          r0 = r1
        else
          if has_terminal?('\G[A-Z]', true, index)
            r2 = true
            @index += 1
          else
            r2 = nil
          end
          if r2
            r0 = r2
          else
            @index = i0
            r0 = nil
          end
        end

        node_cache[:alpha][start_index] = r0

        r0
      end

      def _nt_vchar
        start_index = index
        if node_cache[:vchar].has_key?(index)
          cached = node_cache[:vchar][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?('\G[\\x21-\\x7e]', true, index)
          r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          r0 = nil
        end

        node_cache[:vchar][start_index] = r0

        r0
      end

      def _nt_dquote
        start_index = index
        if node_cache[:dquote].has_key?(index)
          cached = node_cache[:dquote][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?("\"", false, index)
          r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("\"")
          r0 = nil
        end

        node_cache[:dquote][start_index] = r0

        r0
      end

      def _nt_cr
        start_index = index
        if node_cache[:cr].has_key?(index)
          cached = node_cache[:cr][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?("\r", false, index)
          r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("\r")
          r0 = nil
        end

        node_cache[:cr][start_index] = r0

        r0
      end

      def _nt_lf
        start_index = index
        if node_cache[:lf].has_key?(index)
          cached = node_cache[:lf][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?("\n", false, index)
          r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("\n")
          r0 = nil
        end

        node_cache[:lf][start_index] = r0

        r0
      end

      module Crlf0
        def cr
          elements[0]
        end

        def lf
          elements[1]
        end
      end

      def _nt_crlf
        start_index = index
        if node_cache[:crlf].has_key?(index)
          cached = node_cache[:crlf][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_cr
        s0 << r1
        if r1
          r2 = _nt_lf
          s0 << r2
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Crlf0)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:crlf][start_index] = r0

        r0
      end

      def _nt_sp
        start_index = index
        if node_cache[:sp].has_key?(index)
          cached = node_cache[:sp][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?(" ", false, index)
          r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure(" ")
          r0 = nil
        end

        node_cache[:sp][start_index] = r0

        r0
      end

      def _nt_htab
        start_index = index
        if node_cache[:htab].has_key?(index)
          cached = node_cache[:htab][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        if has_terminal?("\t", false, index)
          r0 = instantiate_node(SyntaxNode,input, index...(index + 1))
          @index += 1
        else
          terminal_parse_failure("\t")
          r0 = nil
        end

        node_cache[:htab][start_index] = r0

        r0
      end

      def _nt_obs_fold
        start_index = index
        if node_cache[:obs_fold].has_key?(index)
          cached = node_cache[:obs_fold][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        r0 = _nt_crlf

        node_cache[:obs_fold][start_index] = r0

        r0
      end

      def _nt_wsp
        start_index = index
        if node_cache[:wsp].has_key?(index)
          cached = node_cache[:wsp][index]
          if cached
            cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        r1 = _nt_sp
        if r1
          r0 = r1
        else
          r2 = _nt_htab
          if r2
            r0 = r2
          else
            @index = i0
            r0 = nil
          end
        end

        node_cache[:wsp][start_index] = r0

        r0
      end

    end

    class MediaTypeParser < Treetop::Runtime::CompiledParser
      include MediaType
    end

  end
end
