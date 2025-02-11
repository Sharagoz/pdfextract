# Taken from pdfminer, in turn extracted from AFM files at:
# 
#   http://www.ctan.org/tex-archive/fonts/adobe/afm/
#

###  BEGIN Verbatim copy of the license part

#
# Adobe Core 35 AFM Files with 229 Glyph Entries - ReadMe
#
# This file and the 35 PostScript(R) AFM files it accompanies may be
# used, copied, and distributed for any purpose and without charge,
# with or without modification, provided that all copyright notices
# are retained; that the AFM files are not distributed without this
# file; that all modifications to this file or any of the AFM files
# are prominently noted in the modified file(s); and that this
# paragraph is not modified. Adobe Systems has no responsibility or
# obligation to support the use of the AFM files.
#

###  END Verbatim copy of the license part

module PdfExtract
  class FontMetrics

    attr_accessor :ascent, :descent, :bbox

    def initialize font
      @ascent = 0
      @descent = 0
      @bbox = [0, 0, 0, 0]
      
      base_font = font.basefont.to_s
      if @@base_fonts.key? base_font
        @ascent = @@base_fonts[base_font][:Ascent]
        @descent = @@base_fonts[base_font][:Descent]
        @bbox = @@base_fonts[base_font][:FontBBox]
        @glyph_width_lookup = proc { |c|
          @@base_fonts[base_font][:Widths].fetch(c.codepoints.first, 0)
        } 
      else
        @ascent = font.ascent
        @descent = font.descent
        @bbox = font.bbox
        @glyph_width_lookup = proc { |c| font.glyph_width c }
      end

      if not @bbox.nil?
        @ascent = @bbox[3] if @ascent.nil? || @ascent.zero?
        @descent = @bbox[1] if @descent.nil? || @descent.zero?
      end
    end

    def glyph_width c
      @glyph_width_lookup.call c
    end

    @@base_fonts = {
      'Courier-Oblique' => {
        :FontName => 'Courier-Oblique',
        :Descent => -194.0,
        :FontBBox => [-49.0, -249.0, 749.0, 803.0],
        :FontWeight => 'Medium',
        :CapHeight => 572.0,
        :FontFamily => 'Courier',
        :Flags => 64,
        :XHeight => 434.0,
        :ItalicAngle => -11.0,
        :Ascent => 627.0,
        :Widths => {32 => 600, 33 => 600, 34 => 600, 35 => 600, 36 => 600, 37 => 600, 38 => 600, 39 => 600, 40 => 600, 41 => 600, 42 => 600, 43 => 600, 44 => 600, 45 => 600, 46 => 600, 47 => 600, 48 => 600, 49 => 600, 50 => 600, 51 => 600, 52 => 600, 53 => 600, 54 => 600, 55 => 600, 56 => 600, 57 => 600, 58 => 600, 59 => 600, 60 => 600, 61 => 600, 62 => 600, 63 => 600, 64 => 600, 65 => 600, 66 => 600, 67 => 600, 68 => 600, 69 => 600, 70 => 600, 71 => 600, 72 => 600, 73 => 600, 74 => 600, 75 => 600, 76 => 600, 77 => 600, 78 => 600, 79 => 600, 80 => 600, 81 => 600, 82 => 600, 83 => 600, 84 => 600, 85 => 600, 86 => 600, 87 => 600, 88 => 600, 89 => 600, 90 => 600, 91 => 600, 92 => 600, 93 => 600, 94 => 600, 95 => 600, 96 => 600, 97 => 600, 98 => 600, 99 => 600, 100 => 600, 101 => 600, 102 => 600, 103 => 600, 104 => 600, 105 => 600, 106 => 600, 107 => 600, 108 => 600, 109 => 600, 110 => 600, 111 => 600, 112 => 600, 113 => 600, 114 => 600, 115 => 600, 116 => 600, 117 => 600, 118 => 600, 119 => 600, 120 => 600, 121 => 600, 122 => 600, 123 => 600, 124 => 600, 125 => 600, 126 => 600, 161 => 600, 162 => 600, 163 => 600, 164 => 600, 165 => 600, 166 => 600, 167 => 600, 168 => 600, 169 => 600, 170 => 600, 171 => 600, 172 => 600, 173 => 600, 174 => 600, 175 => 600, 177 => 600, 178 => 600, 179 => 600, 180 => 600, 182 => 600, 183 => 600, 184 => 600, 185 => 600, 186 => 600, 187 => 600, 188 => 600, 189 => 600, 191 => 600, 193 => 600, 194 => 600, 195 => 600, 196 => 600, 197 => 600, 198 => 600, 199 => 600, 200 => 600, 202 => 600, 203 => 600, 205 => 600, 206 => 600, 207 => 600, 208 => 600, 225 => 600, 227 => 600, 232 => 600, 233 => 600, 234 => 600, 235 => 600, 241 => 600, 245 => 600, 248 => 600, 249 => 600, 250 => 600, 251 => 600}
      },

      'Times-BoldItalic' => {
        :FontName => 'Times-BoldItalic',
        :Descent => -217.0,
        :FontBBox => [-200.0, -218.0, 996.0, 921.0],
        :FontWeight => 'Bold',
        :CapHeight => 669.0,
        :FontFamily =>'Times',
        :Flags => 0,
        :XHeight => 462.0,
        :ItalicAngle => -15.0,
        :Ascent => 683.0,
        :Widths => {32 => 250, 33 => 389, 34 => 555, 35 => 500, 36 => 500, 37 => 833, 38 => 778, 39 => 333, 40 => 333, 41 => 333, 42 => 500, 43 => 570, 44 => 250, 45 => 333, 46 => 250, 47 => 278, 48 => 500, 49 => 500, 50 => 500, 51 => 500, 52 => 500, 53 => 500, 54 => 500, 55 => 500, 56 => 500, 57 => 500, 58 => 333, 59 => 333, 60 => 570, 61 => 570, 62 => 570, 63 => 500, 64 => 832, 65 => 667, 66 => 667, 67 => 667, 68 => 722, 69 => 667, 70 => 667, 71 => 722, 72 => 778, 73 => 389, 74 => 500, 75 => 667, 76 => 611, 77 => 889, 78 => 722, 79 => 722, 80 => 611, 81 => 722, 82 => 667, 83 => 556, 84 => 611, 85 => 722, 86 => 667, 87 => 889, 88 => 667, 89 => 611, 90 => 611, 91 => 333, 92 => 278, 93 => 333, 94 => 570, 95 => 500, 96 => 333, 97 => 500, 98 => 500, 99 => 444, 100 => 500, 101 => 444, 102 => 333, 103 => 500, 104 => 556, 105 => 278, 106 => 278, 107 => 500, 108 => 278, 109 => 778, 110 => 556, 111 => 500, 112 => 500, 113 => 500, 114 => 389, 115 => 389, 116 => 278, 117 => 556, 118 => 444, 119 => 667, 120 => 500, 121 => 444, 122 => 389, 123 => 348, 124 => 220, 125 => 348, 126 => 570, 161 => 389, 162 => 500, 163 => 500, 164 => 167, 165 => 500, 166 => 500, 167 => 500, 168 => 500, 169 => 278, 170 => 500, 171 => 500, 172 => 333, 173 => 333, 174 => 556, 175 => 556, 177 => 500, 178 => 500, 179 => 500, 180 => 250, 182 => 500, 183 => 350, 184 => 333, 185 => 500, 186 => 500, 187 => 500, 188 => 1000, 189 => 1000, 191 => 500, 193 => 333, 194 => 333, 195 => 333, 196 => 333, 197 => 333, 198 => 333, 199 => 333, 200 => 333, 202 => 333, 203 => 333, 205 => 333, 206 => 333, 207 => 333, 208 => 1000, 225 => 944, 227 => 266, 232 => 611, 233 => 722, 234 => 944, 235 => 300, 241 => 722, 245 => 278, 248 => 278, 249 => 500, 250 => 722, 251 => 500}
      },

      'Helvetica-Bold' => {
        :FontName => 'Helvetica-Bold',
        :Descent => -207.0,
        :FontBBox => [-170.0, -228.0, 1003.0, 962.0],
        :FontWeight => 'Bold',
        :CapHeight => 718.0,
        :FontFamily => 'Helvetica',
        :Flags => 0,
        :XHeight => 532.0,
        :ItalicAngle => 0.0,
        :Ascent => 718.0,
        :Widths => {32 => 278, 33 => 333, 34 => 474, 35 => 556, 36 => 556, 37 => 889, 38 => 722, 39 => 278, 40 => 333, 41 => 333, 42 => 389, 43 => 584, 44 => 278, 45 => 333, 46 => 278, 47 => 278, 48 => 556, 49 => 556, 50 => 556, 51 => 556, 52 => 556, 53 => 556, 54 => 556, 55 => 556, 56 => 556, 57 => 556, 58 => 333, 59 => 333, 60 => 584, 61 => 584, 62 => 584, 63 => 611, 64 => 975, 65 => 722, 66 => 722, 67 => 722, 68 => 722, 69 => 667, 70 => 611, 71 => 778, 72 => 722, 73 => 278, 74 => 556, 75 => 722, 76 => 611, 77 => 833, 78 => 722, 79 => 778, 80 => 667, 81 => 778, 82 => 722, 83 => 667, 84 => 611, 85 => 722, 86 => 667, 87 => 944, 88 => 667, 89 => 667, 90 => 611, 91 => 333, 92 => 278, 93 => 333, 94 => 584, 95 => 556, 96 => 278, 97 => 556, 98 => 611, 99 => 556, 100 => 611, 101 => 556, 102 => 333, 103 => 611, 104 => 611, 105 => 278, 106 => 278, 107 => 556, 108 => 278, 109 => 889, 110 => 611, 111 => 611, 112 => 611, 113 => 611, 114 => 389, 115 => 556, 116 => 333, 117 => 611, 118 => 556, 119 => 778, 120 => 556, 121 => 556, 122 => 500, 123 => 389, 124 => 280, 125 => 389, 126 => 584, 161 => 333, 162 => 556, 163 => 556, 164 => 167, 165 => 556, 166 => 556, 167 => 556, 168 => 556, 169 => 238, 170 => 500, 171 => 556, 172 => 333, 173 => 333, 174 => 611, 175 => 611, 177 => 556, 178 => 556, 179 => 556, 180 => 278, 182 => 556, 183 => 350, 184 => 278, 185 => 500, 186 => 500, 187 => 556, 188 => 1000, 189 => 1000, 191 => 611, 193 => 333, 194 => 333, 195 => 333, 196 => 333, 197 => 333, 198 => 333, 199 => 333, 200 => 333, 202 => 333, 203 => 333, 205 => 333, 206 => 333, 207 => 333, 208 => 1000, 225 => 1000, 227 => 370, 232 => 611, 233 => 778, 234 => 1000, 235 => 365, 241 => 889, 245 => 278, 248 => 278, 249 => 611, 250 => 944, 251 => 611}
      },

      'Courier' => {
        :FontName => 'Courier',
        :Descent => -194.0,
        :FontBBox => [-6.0, -249.0, 639.0, 803.0],
        :FontWeight => 'Medium',
        :CapHeight => 572.0,
        :FontFamily => 'Courier',
        :Flags => 64,
        :XHeight => 434.0,
        :ItalicAngle => 0.0,
        :Ascent => 627.0,
        :Widths => {32 => 600, 33 => 600, 34 => 600, 35 => 600, 36 => 600, 37 => 600, 38 => 600, 39 => 600, 40 => 600, 41 => 600, 42 => 600, 43 => 600, 44 => 600, 45 => 600, 46 => 600, 47 => 600, 48 => 600, 49 => 600, 50 => 600, 51 => 600, 52 => 600, 53 => 600, 54 => 600, 55 => 600, 56 => 600, 57 => 600, 58 => 600, 59 => 600, 60 => 600, 61 => 600, 62 => 600, 63 => 600, 64 => 600, 65 => 600, 66 => 600, 67 => 600, 68 => 600, 69 => 600, 70 => 600, 71 => 600, 72 => 600, 73 => 600, 74 => 600, 75 => 600, 76 => 600, 77 => 600, 78 => 600, 79 => 600, 80 => 600, 81 => 600, 82 => 600, 83 => 600, 84 => 600, 85 => 600, 86 => 600, 87 => 600, 88 => 600, 89 => 600, 90 => 600, 91 => 600, 92 => 600, 93 => 600, 94 => 600, 95 => 600, 96 => 600, 97 => 600, 98 => 600, 99 => 600, 100 => 600, 101 => 600, 102 => 600, 103 => 600, 104 => 600, 105 => 600, 106 => 600, 107 => 600, 108 => 600, 109 => 600, 110 => 600, 111 => 600, 112 => 600, 113 => 600, 114 => 600, 115 => 600, 116 => 600, 117 => 600, 118 => 600, 119 => 600, 120 => 600, 121 => 600, 122 => 600, 123 => 600, 124 => 600, 125 => 600, 126 => 600, 161 => 600, 162 => 600, 163 => 600, 164 => 600, 165 => 600, 166 => 600, 167 => 600, 168 => 600, 169 => 600, 170 => 600, 171 => 600, 172 => 600, 173 => 600, 174 => 600, 175 => 600, 177 => 600, 178 => 600, 179 => 600, 180 => 600, 182 => 600, 183 => 600, 184 => 600, 185 => 600, 186 => 600, 187 => 600, 188 => 600, 189 => 600, 191 => 600, 193 => 600, 194 => 600, 195 => 600, 196 => 600, 197 => 600, 198 => 600, 199 => 600, 200 => 600, 202 => 600, 203 => 600, 205 => 600, 206 => 600, 207 => 600, 208 => 600, 225 => 600, 227 => 600, 232 => 600, 233 => 600, 234 => 600, 235 => 600, 241 => 600, 245 => 600, 248 => 600, 249 => 600, 250 => 600, 251 => 600}
      },

      'Courier-BoldOblique' => {
        :FontName => 'Courier-BoldOblique',
        :Descent => -194.0,
        :FontBBox => [-49.0, -249.0, 758.0, 811.0],
        :FontWeight => 'Bold',
        :CapHeight => 572.0,
        :FontFamily => 'Courier',
        :Flags => 64,
        :XHeight => 434.0,
        :ItalicAngle => -11.0,
        :Ascent => 627.0,
        :Widths => {32 => 600, 33 => 600, 34 => 600, 35 => 600, 36 => 600, 37 => 600, 38 => 600, 39 => 600, 40 => 600, 41 => 600, 42 => 600, 43 => 600, 44 => 600, 45 => 600, 46 => 600, 47 => 600, 48 => 600, 49 => 600, 50 => 600, 51 => 600, 52 => 600, 53 => 600, 54 => 600, 55 => 600, 56 => 600, 57 => 600, 58 => 600, 59 => 600, 60 => 600, 61 => 600, 62 => 600, 63 => 600, 64 => 600, 65 => 600, 66 => 600, 67 => 600, 68 => 600, 69 => 600, 70 => 600, 71 => 600, 72 => 600, 73 => 600, 74 => 600, 75 => 600, 76 => 600, 77 => 600, 78 => 600, 79 => 600, 80 => 600, 81 => 600, 82 => 600, 83 => 600, 84 => 600, 85 => 600, 86 => 600, 87 => 600, 88 => 600, 89 => 600, 90 => 600, 91 => 600, 92 => 600, 93 => 600, 94 => 600, 95 => 600, 96 => 600, 97 => 600, 98 => 600, 99 => 600, 100 => 600, 101 => 600, 102 => 600, 103 => 600, 104 => 600, 105 => 600, 106 => 600, 107 => 600, 108 => 600, 109 => 600, 110 => 600, 111 => 600, 112 => 600, 113 => 600, 114 => 600, 115 => 600, 116 => 600, 117 => 600, 118 => 600, 119 => 600, 120 => 600, 121 => 600, 122 => 600, 123 => 600, 124 => 600, 125 => 600, 126 => 600, 161 => 600, 162 => 600, 163 => 600, 164 => 600, 165 => 600, 166 => 600, 167 => 600, 168 => 600, 169 => 600, 170 => 600, 171 => 600, 172 => 600, 173 => 600, 174 => 600, 175 => 600, 177 => 600, 178 => 600, 179 => 600, 180 => 600, 182 => 600, 183 => 600, 184 => 600, 185 => 600, 186 => 600, 187 => 600, 188 => 600, 189 => 600, 191 => 600, 193 => 600, 194 => 600, 195 => 600, 196 => 600, 197 => 600, 198 => 600, 199 => 600, 200 => 600, 202 => 600, 203 => 600, 205 => 600, 206 => 600, 207 => 600, 208 => 600, 225 => 600, 227 => 600, 232 => 600, 233 => 600, 234 => 600, 235 => 600, 241 => 600, 245 => 600, 248 => 600, 249 => 600, 250 => 600, 251 => 600}
      },

      'Times-Bold' => {
        :FontName => 'Times-Bold',
        :Descent => -217.0,
        :FontBBox => [-168.0, -218.0, 1000.0, 935.0],
        :FontWeight => 'Bold',
        :CapHeight => 676.0,
        :FontFamily => 'Times',
        :Flags => 0,
        :XHeight => 461.0,
        :ItalicAngle => 0.0,
        :Ascent => 683.0,
        :Widths => {32 => 250, 33 => 333, 34 => 555, 35 => 500, 36 => 500, 37 => 1000, 38 => 833, 39 => 333, 40 => 333, 41 => 333, 42 => 500, 43 => 570, 44 => 250, 45 => 333, 46 => 250, 47 => 278, 48 => 500, 49 => 500, 50 => 500, 51 => 500, 52 => 500, 53 => 500, 54 => 500, 55 => 500, 56 => 500, 57 => 500, 58 => 333, 59 => 333, 60 => 570, 61 => 570, 62 => 570, 63 => 500, 64 => 930, 65 => 722, 66 => 667, 67 => 722, 68 => 722, 69 => 667, 70 => 611, 71 => 778, 72 => 778, 73 => 389, 74 => 500, 75 => 778, 76 => 667, 77 => 944, 78 => 722, 79 => 778, 80 => 611, 81 => 778, 82 => 722, 83 => 556, 84 => 667, 85 => 722, 86 => 722, 87 => 1000, 88 => 722, 89 => 722, 90 => 667, 91 => 333, 92 => 278, 93 => 333, 94 => 581, 95 => 500, 96 => 333, 97 => 500, 98 => 556, 99 => 444, 100 => 556, 101 => 444, 102 => 333, 103 => 500, 104 => 556, 105 => 278, 106 => 333, 107 => 556, 108 => 278, 109 => 833, 110 => 556, 111 => 500, 112 => 556, 113 => 556, 114 => 444, 115 => 389, 116 => 333, 117 => 556, 118 => 500, 119 => 722, 120 => 500, 121 => 500, 122 => 444, 123 => 394, 124 => 220, 125 => 394, 126 => 520, 161 => 333, 162 => 500, 163 => 500, 164 => 167, 165 => 500, 166 => 500, 167 => 500, 168 => 500, 169 => 278, 170 => 500, 171 => 500, 172 => 333, 173 => 333, 174 => 556, 175 => 556, 177 => 500, 178 => 500, 179 => 500, 180 => 250, 182 => 540, 183 => 350, 184 => 333, 185 => 500, 186 => 500, 187 => 500, 188 => 1000, 189 => 1000, 191 => 500, 193 => 333, 194 => 333, 195 => 333, 196 => 333, 197 => 333, 198 => 333, 199 => 333, 200 => 333, 202 => 333, 203 => 333, 205 => 333, 206 => 333, 207 => 333, 208 => 1000, 225 => 1000, 227 => 300, 232 => 667, 233 => 778, 234 => 1000, 235 => 330, 241 => 722, 245 => 278, 248 => 278, 249 => 500, 250 => 722, 251 => 556}
      },

      'Symbol' => {
        :FontName => 'Symbol',
        :FontBBox => [-180.0, -293.0, 1090.0, 1010.0],
        :FontWeight => 'Medium',
        :FontFamily => 'Symbol',
        :Flags => 0,
        :ItalicAngle => 0.0,
        :Widths => {32 => 250, 33 => 333, 34 => 713, 35 => 500, 36 => 549, 37 => 833, 38 => 778, 39 => 439, 40 => 333, 41 => 333, 42 => 500, 43 => 549, 44 => 250, 45 => 549, 46 => 250, 47 => 278, 48 => 500, 49 => 500, 50 => 500, 51 => 500, 52 => 500, 53 => 500, 54 => 500, 55 => 500, 56 => 500, 57 => 500, 58 => 278, 59 => 278, 60 => 549, 61 => 549, 62 => 549, 63 => 444, 64 => 549, 65 => 722, 66 => 667, 67 => 722, 68 => 612, 69 => 611, 70 => 763, 71 => 603, 72 => 722, 73 => 333, 74 => 631, 75 => 722, 76 => 686, 77 => 889, 78 => 722, 79 => 722, 80 => 768, 81 => 741, 82 => 556, 83 => 592, 84 => 611, 85 => 690, 86 => 439, 87 => 768, 88 => 645, 89 => 795, 90 => 611, 91 => 333, 92 => 863, 93 => 333, 94 => 658, 95 => 500, 96 => 500, 97 => 631, 98 => 549, 99 => 549, 100 => 494, 101 => 439, 102 => 521, 103 => 411, 104 => 603, 105 => 329, 106 => 603, 107 => 549, 108 => 549, 109 => 576, 110 => 521, 111 => 549, 112 => 549, 113 => 521, 114 => 549, 115 => 603, 116 => 439, 117 => 576, 118 => 713, 119 => 686, 120 => 493, 121 => 686, 122 => 494, 123 => 480, 124 => 200, 125 => 480, 126 => 549, 160 => 750, 161 => 620, 162 => 247, 163 => 549, 164 => 167, 165 => 713, 166 => 500, 167 => 753, 168 => 753, 169 => 753, 170 => 753, 171 => 1042, 172 => 987, 173 => 603, 174 => 987, 175 => 603, 176 => 400, 177 => 549, 178 => 411, 179 => 549, 180 => 549, 181 => 713, 182 => 494, 183 => 460, 184 => 549, 185 => 549, 186 => 549, 187 => 549, 188 => 1000, 189 => 603, 190 => 1000, 191 => 658, 192 => 823, 193 => 686, 194 => 795, 195 => 987, 196 => 768, 197 => 768, 198 => 823, 199 => 768, 200 => 768, 201 => 713, 202 => 713, 203 => 713, 204 => 713, 205 => 713, 206 => 713, 207 => 713, 208 => 768, 209 => 713, 210 => 790, 211 => 790, 212 => 890, 213 => 823, 214 => 549, 215 => 250, 216 => 713, 217 => 603, 218 => 603, 219 => 1042, 220 => 987, 221 => 603, 222 => 987, 223 => 603, 224 => 494, 225 => 329, 226 => 790, 227 => 790, 228 => 786, 229 => 713, 230 => 384, 231 => 384, 232 => 384, 233 => 384, 234 => 384, 235 => 384, 236 => 494, 237 => 494, 238 => 494, 239 => 494, 241 => 329, 242 => 274, 243 => 686, 244 => 686, 245 => 686, 246 => 384, 247 => 384, 248 => 384, 249 => 384, 250 => 384, 251 => 384, 252 => 494, 253 => 494, 254 => 494}
      },

      'Helvetica' => {
        :FontName => 'Helvetica',
        :Descent => -207.0,
        :FontBBox => [-166.0, -225.0, 1000.0, 931.0],
        :FontWeight => 'Medium',
        :CapHeight => 718.0,
        :FontFamily => 'Helvetica',
        :Flags => 0,
        :XHeight => 523.0,
        :ItalicAngle => 0.0,
        :Ascent => 718.0,
        :Widths => {32 => 278, 33 => 278, 34 => 355, 35 => 556, 36 => 556, 37 => 889, 38 => 667, 39 => 222, 40 => 333, 41 => 333, 42 => 389, 43 => 584, 44 => 278, 45 => 333, 46 => 278, 47 => 278, 48 => 556, 49 => 556, 50 => 556, 51 => 556, 52 => 556, 53 => 556, 54 => 556, 55 => 556, 56 => 556, 57 => 556, 58 => 278, 59 => 278, 60 => 584, 61 => 584, 62 => 584, 63 => 556, 64 => 1015, 65 => 667, 66 => 667, 67 => 722, 68 => 722, 69 => 667, 70 => 611, 71 => 778, 72 => 722, 73 => 278, 74 => 500, 75 => 667, 76 => 556, 77 => 833, 78 => 722, 79 => 778, 80 => 667, 81 => 778, 82 => 722, 83 => 667, 84 => 611, 85 => 722, 86 => 667, 87 => 944, 88 => 667, 89 => 667, 90 => 611, 91 => 278, 92 => 278, 93 => 278, 94 => 469, 95 => 556, 96 => 222, 97 => 556, 98 => 556, 99 => 500, 100 => 556, 101 => 556, 102 => 278, 103 => 556, 104 => 556, 105 => 222, 106 => 222, 107 => 500, 108 => 222, 109 => 833, 110 => 556, 111 => 556, 112 => 556, 113 => 556, 114 => 333, 115 => 500, 116 => 278, 117 => 556, 118 => 500, 119 => 722, 120 => 500, 121 => 500, 122 => 500, 123 => 334, 124 => 260, 125 => 334, 126 => 584, 161 => 333, 162 => 556, 163 => 556, 164 => 167, 165 => 556, 166 => 556, 167 => 556, 168 => 556, 169 => 191, 170 => 333, 171 => 556, 172 => 333, 173 => 333, 174 => 500, 175 => 500, 177 => 556, 178 => 556, 179 => 556, 180 => 278, 182 => 537, 183 => 350, 184 => 222, 185 => 333, 186 => 333, 187 => 556, 188 => 1000, 189 => 1000, 191 => 611, 193 => 333, 194 => 333, 195 => 333, 196 => 333, 197 => 333, 198 => 333, 199 => 333, 200 => 333, 202 => 333, 203 => 333, 205 => 333, 206 => 333, 207 => 333, 208 => 1000, 225 => 1000, 227 => 370, 232 => 556, 233 => 778, 234 => 1000, 235 => 365, 241 => 889, 245 => 278, 248 => 222, 249 => 611, 250 => 944, 251 => 611}
      },

      'Helvetica-BoldOblique' => {
        :FontName => 'Helvetica-BoldOblique',
        :Descent => -207.0,
        :FontBBox => [-175.0, -228.0, 1114.0, 962.0],
        :FontWeight => 'Bold',
        :CapHeight => 718.0,
        :FontFamily => 'Helvetica',
        :Flags => 0,
        :XHeight => 532.0,
        :ItalicAngle => -12.0,
        :Ascent => 718.0,
        :Widths => {32 => 278, 33 => 333, 34 => 474, 35 => 556, 36 => 556, 37 => 889, 38 => 722, 39 => 278, 40 => 333, 41 => 333, 42 => 389, 43 => 584, 44 => 278, 45 => 333, 46 => 278, 47 => 278, 48 => 556, 49 => 556, 50 => 556, 51 => 556, 52 => 556, 53 => 556, 54 => 556, 55 => 556, 56 => 556, 57 => 556, 58 => 333, 59 => 333, 60 => 584, 61 => 584, 62 => 584, 63 => 611, 64 => 975, 65 => 722, 66 => 722, 67 => 722, 68 => 722, 69 => 667, 70 => 611, 71 => 778, 72 => 722, 73 => 278, 74 => 556, 75 => 722, 76 => 611, 77 => 833, 78 => 722, 79 => 778, 80 => 667, 81 => 778, 82 => 722, 83 => 667, 84 => 611, 85 => 722, 86 => 667, 87 => 944, 88 => 667, 89 => 667, 90 => 611, 91 => 333, 92 => 278, 93 => 333, 94 => 584, 95 => 556, 96 => 278, 97 => 556, 98 => 611, 99 => 556, 100 => 611, 101 => 556, 102 => 333, 103 => 611, 104 => 611, 105 => 278, 106 => 278, 107 => 556, 108 => 278, 109 => 889, 110 => 611, 111 => 611, 112 => 611, 113 => 611, 114 => 389, 115 => 556, 116 => 333, 117 => 611, 118 => 556, 119 => 778, 120 => 556, 121 => 556, 122 => 500, 123 => 389, 124 => 280, 125 => 389, 126 => 584, 161 => 333, 162 => 556, 163 => 556, 164 => 167, 165 => 556, 166 => 556, 167 => 556, 168 => 556, 169 => 238, 170 => 500, 171 => 556, 172 => 333, 173 => 333, 174 => 611, 175 => 611, 177 => 556, 178 => 556, 179 => 556, 180 => 278, 182 => 556, 183 => 350, 184 => 278, 185 => 500, 186 => 500, 187 => 556, 188 => 1000, 189 => 1000, 191 => 611, 193 => 333, 194 => 333, 195 => 333, 196 => 333, 197 => 333, 198 => 333, 199 => 333, 200 => 333, 202 => 333, 203 => 333, 205 => 333, 206 => 333, 207 => 333, 208 => 1000, 225 => 1000, 227 => 370, 232 => 611, 233 => 778, 234 => 1000, 235 => 365, 241 => 889, 245 => 278, 248 => 278, 249 => 611, 250 => 944, 251 => 611}
      },

      'ZapfDingbats' => {
        :FontName => 'ZapfDingbats',
        :FontBBox => [-1.0, -143.0, 981.0, 820.0],
        :FontWeight => 'Medium',
        :FontFamily => 'ITC',
        :Flags => 0,
        :ItalicAngle => 0.0,
        :Widths => {32 => 278, 33 => 974, 34 => 961, 35 => 974, 36 => 980, 37 => 719, 38 => 789, 39 => 790, 40 => 791, 41 => 690, 42 => 960, 43 => 939, 44 => 549, 45 => 855, 46 => 911, 47 => 933, 48 => 911, 49 => 945, 50 => 974, 51 => 755, 52 => 846, 53 => 762, 54 => 761, 55 => 571, 56 => 677, 57 => 763, 58 => 760, 59 => 759, 60 => 754, 61 => 494, 62 => 552, 63 => 537, 64 => 577, 65 => 692, 66 => 786, 67 => 788, 68 => 788, 69 => 790, 70 => 793, 71 => 794, 72 => 816, 73 => 823, 74 => 789, 75 => 841, 76 => 823, 77 => 833, 78 => 816, 79 => 831, 80 => 923, 81 => 744, 82 => 723, 83 => 749, 84 => 790, 85 => 792, 86 => 695, 87 => 776, 88 => 768, 89 => 792, 90 => 759, 91 => 707, 92 => 708, 93 => 682, 94 => 701, 95 => 826, 96 => 815, 97 => 789, 98 => 789, 99 => 707, 100 => 687, 101 => 696, 102 => 689, 103 => 786, 104 => 787, 105 => 713, 106 => 791, 107 => 785, 108 => 791, 109 => 873, 110 => 761, 111 => 762, 112 => 762, 113 => 759, 114 => 759, 115 => 892, 116 => 892, 117 => 788, 118 => 784, 119 => 438, 120 => 138, 121 => 277, 122 => 415, 123 => 392, 124 => 392, 125 => 668, 126 => 668, 128 => 390, 129 => 390, 130 => 317, 131 => 317, 132 => 276, 133 => 276, 134 => 509, 135 => 509, 136 => 410, 137 => 410, 138 => 234, 139 => 234, 140 => 334, 141 => 334, 161 => 732, 162 => 544, 163 => 544, 164 => 910, 165 => 667, 166 => 760, 167 => 760, 168 => 776, 169 => 595, 170 => 694, 171 => 626, 172 => 788, 173 => 788, 174 => 788, 175 => 788, 176 => 788, 177 => 788, 178 => 788, 179 => 788, 180 => 788, 181 => 788, 182 => 788, 183 => 788, 184 => 788, 185 => 788, 186 => 788, 187 => 788, 188 => 788, 189 => 788, 190 => 788, 191 => 788, 192 => 788, 193 => 788, 194 => 788, 195 => 788, 196 => 788, 197 => 788, 198 => 788, 199 => 788, 200 => 788, 201 => 788, 202 => 788, 203 => 788, 204 => 788, 205 => 788, 206 => 788, 207 => 788, 208 => 788, 209 => 788, 210 => 788, 211 => 788, 212 => 894, 213 => 838, 214 => 1016, 215 => 458, 216 => 748, 217 => 924, 218 => 748, 219 => 918, 220 => 927, 221 => 928, 222 => 928, 223 => 834, 224 => 873, 225 => 828, 226 => 924, 227 => 924, 228 => 917, 229 => 930, 230 => 931, 231 => 463, 232 => 883, 233 => 836, 234 => 836, 235 => 867, 236 => 867, 237 => 696, 238 => 696, 239 => 874, 241 => 874, 242 => 760, 243 => 946, 244 => 771, 245 => 865, 246 => 771, 247 => 888, 248 => 967, 249 => 888, 250 => 831, 251 => 873, 252 => 927, 253 => 970, 254 => 918}
      },

      'Courier-Bold' => {
        :FontName => 'Courier-Bold',
        :Descent => -194.0,
        :FontBBox => [-88.0, -249.0, 697.0, 811.0],
        :FontWeight => 'Bold',
        :CapHeight => 572.0,
        :FontFamily => 'Courier',
        :Flags => 64,
        :XHeight => 434.0,
        :ItalicAngle => 0.0,
        :Ascent => 627.0,
        :Widths => {32 => 600, 33 => 600, 34 => 600, 35 => 600, 36 => 600, 37 => 600, 38 => 600, 39 => 600, 40 => 600, 41 => 600, 42 => 600, 43 => 600, 44 => 600, 45 => 600, 46 => 600, 47 => 600, 48 => 600, 49 => 600, 50 => 600, 51 => 600, 52 => 600, 53 => 600, 54 => 600, 55 => 600, 56 => 600, 57 => 600, 58 => 600, 59 => 600, 60 => 600, 61 => 600, 62 => 600, 63 => 600, 64 => 600, 65 => 600, 66 => 600, 67 => 600, 68 => 600, 69 => 600, 70 => 600, 71 => 600, 72 => 600, 73 => 600, 74 => 600, 75 => 600, 76 => 600, 77 => 600, 78 => 600, 79 => 600, 80 => 600, 81 => 600, 82 => 600, 83 => 600, 84 => 600, 85 => 600, 86 => 600, 87 => 600, 88 => 600, 89 => 600, 90 => 600, 91 => 600, 92 => 600, 93 => 600, 94 => 600, 95 => 600, 96 => 600, 97 => 600, 98 => 600, 99 => 600, 100 => 600, 101 => 600, 102 => 600, 103 => 600, 104 => 600, 105 => 600, 106 => 600, 107 => 600, 108 => 600, 109 => 600, 110 => 600, 111 => 600, 112 => 600, 113 => 600, 114 => 600, 115 => 600, 116 => 600, 117 => 600, 118 => 600, 119 => 600, 120 => 600, 121 => 600, 122 => 600, 123 => 600, 124 => 600, 125 => 600, 126 => 600, 161 => 600, 162 => 600, 163 => 600, 164 => 600, 165 => 600, 166 => 600, 167 => 600, 168 => 600, 169 => 600, 170 => 600, 171 => 600, 172 => 600, 173 => 600, 174 => 600, 175 => 600, 177 => 600, 178 => 600, 179 => 600, 180 => 600, 182 => 600, 183 => 600, 184 => 600, 185 => 600, 186 => 600, 187 => 600, 188 => 600, 189 => 600, 191 => 600, 193 => 600, 194 => 600, 195 => 600, 196 => 600, 197 => 600, 198 => 600, 199 => 600, 200 => 600, 202 => 600, 203 => 600, 205 => 600, 206 => 600, 207 => 600, 208 => 600, 225 => 600, 227 => 600, 232 => 600, 233 => 600, 234 => 600, 235 => 600, 241 => 600, 245 => 600, 248 => 600, 249 => 600, 250 => 600, 251 => 600}
      },

      'Times-Italic' => {
        :FontName => 'Times-Italic',
        :Descent => -217.0,
        :FontBBox => [-169.0, -217.0, 1010.0, 883.0],
        :FontWeight => 'Medium',
        :CapHeight => 653.0,
        :FontFamily => 'Times',
        :Flags => 0,
        :XHeight => 441.0,
        :ItalicAngle => -15.5,
        :Ascent => 683.0,
        :Widths => {32 => 250, 33 => 333, 34 => 420, 35 => 500, 36 => 500, 37 => 833, 38 => 778, 39 => 333, 40 => 333, 41 => 333, 42 => 500, 43 => 675, 44 => 250, 45 => 333, 46 => 250, 47 => 278, 48 => 500, 49 => 500, 50 => 500, 51 => 500, 52 => 500, 53 => 500, 54 => 500, 55 => 500, 56 => 500, 57 => 500, 58 => 333, 59 => 333, 60 => 675, 61 => 675, 62 => 675, 63 => 500, 64 => 920, 65 => 611, 66 => 611, 67 => 667, 68 => 722, 69 => 611, 70 => 611, 71 => 722, 72 => 722, 73 => 333, 74 => 444, 75 => 667, 76 => 556, 77 => 833, 78 => 667, 79 => 722, 80 => 611, 81 => 722, 82 => 611, 83 => 500, 84 => 556, 85 => 722, 86 => 611, 87 => 833, 88 => 611, 89 => 556, 90 => 556, 91 => 389, 92 => 278, 93 => 389, 94 => 422, 95 => 500, 96 => 333, 97 => 500, 98 => 500, 99 => 444, 100 => 500, 101 => 444, 102 => 278, 103 => 500, 104 => 500, 105 => 278, 106 => 278, 107 => 444, 108 => 278, 109 => 722, 110 => 500, 111 => 500, 112 => 500, 113 => 500, 114 => 389, 115 => 389, 116 => 278, 117 => 500, 118 => 444, 119 => 667, 120 => 444, 121 => 444, 122 => 389, 123 => 400, 124 => 275, 125 => 400, 126 => 541, 161 => 389, 162 => 500, 163 => 500, 164 => 167, 165 => 500, 166 => 500, 167 => 500, 168 => 500, 169 => 214, 170 => 556, 171 => 500, 172 => 333, 173 => 333, 174 => 500, 175 => 500, 177 => 500, 178 => 500, 179 => 500, 180 => 250, 182 => 523, 183 => 350, 184 => 333, 185 => 556, 186 => 556, 187 => 500, 188 => 889, 189 => 1000, 191 => 500, 193 => 333, 194 => 333, 195 => 333, 196 => 333, 197 => 333, 198 => 333, 199 => 333, 200 => 333, 202 => 333, 203 => 333, 205 => 333, 206 => 333, 207 => 333, 208 => 889, 225 => 889, 227 => 276, 232 => 556, 233 => 722, 234 => 944, 235 => 310, 241 => 667, 245 => 278, 248 => 278, 249 => 500, 250 => 667, 251 => 500}
      },

      'Times-Roman' => {
        :FontName => 'Times-Roman',
        :Descent => -217.0,
        :FontBBox => [-168.0, -218.0, 1000.0, 898.0],
        :FontWeight => 'Roman',
        :CapHeight => 662.0,
        :FontFamily => 'Times',
        :Flags => 0,
        :XHeight => 450.0,
        :ItalicAngle => 0.0,
        :Ascent => 683.0,
        :Widths => {32 => 250, 33 => 333, 34 => 408, 35 => 500, 36 => 500, 37 => 833, 38 => 778, 39 => 333, 40 => 333, 41 => 333, 42 => 500, 43 => 564, 44 => 250, 45 => 333, 46 => 250, 47 => 278, 48 => 500, 49 => 500, 50 => 500, 51 => 500, 52 => 500, 53 => 500, 54 => 500, 55 => 500, 56 => 500, 57 => 500, 58 => 278, 59 => 278, 60 => 564, 61 => 564, 62 => 564, 63 => 444, 64 => 921, 65 => 722, 66 => 667, 67 => 667, 68 => 722, 69 => 611, 70 => 556, 71 => 722, 72 => 722, 73 => 333, 74 => 389, 75 => 722, 76 => 611, 77 => 889, 78 => 722, 79 => 722, 80 => 556, 81 => 722, 82 => 667, 83 => 556, 84 => 611, 85 => 722, 86 => 722, 87 => 944, 88 => 722, 89 => 722, 90 => 611, 91 => 333, 92 => 278, 93 => 333, 94 => 469, 95 => 500, 96 => 333, 97 => 444, 98 => 500, 99 => 444, 100 => 500, 101 => 444, 102 => 333, 103 => 500, 104 => 500, 105 => 278, 106 => 278, 107 => 500, 108 => 278, 109 => 778, 110 => 500, 111 => 500, 112 => 500, 113 => 500, 114 => 333, 115 => 389, 116 => 278, 117 => 500, 118 => 500, 119 => 722, 120 => 500, 121 => 500, 122 => 444, 123 => 480, 124 => 200, 125 => 480, 126 => 541, 161 => 333, 162 => 500, 163 => 500, 164 => 167, 165 => 500, 166 => 500, 167 => 500, 168 => 500, 169 => 180, 170 => 444, 171 => 500, 172 => 333, 173 => 333, 174 => 556, 175 => 556, 177 => 500, 178 => 500, 179 => 500, 180 => 250, 182 => 453, 183 => 350, 184 => 333, 185 => 444, 186 => 444, 187 => 500, 188 => 1000, 189 => 1000, 191 => 444, 193 => 333, 194 => 333, 195 => 333, 196 => 333, 197 => 333, 198 => 333, 199 => 333, 200 => 333, 202 => 333, 203 => 333, 205 => 333, 206 => 333, 207 => 333, 208 => 1000, 225 => 889, 227 => 276, 232 => 611, 233 => 722, 234 => 889, 235 => 310, 241 => 667, 245 => 278, 248 => 278, 249 => 500, 250 => 722, 251 => 500}
      },

      'Helvetica-Oblique' => {
        :FontName => 'Helvetica-Oblique',
        :Descent => -207.0,
        :FontBBox => [-171.0, -225.0, 1116.0, 931.0],
        :FontWeight => 'Medium',
        :CapHeight => 718.0,
        :FontFamily => 'Helvetica',
        :Flags => 0,
        :XHeight => 523.0,
        :ItalicAngle => -12.0,
        :Ascent => 718.0,
        :Widths => {32 => 278, 33 => 278, 34 => 355, 35 => 556, 36 => 556, 37 => 889, 38 => 667, 39 => 222, 40 => 333, 41 => 333, 42 => 389, 43 => 584, 44 => 278, 45 => 333, 46 => 278, 47 => 278, 48 => 556, 49 => 556, 50 => 556, 51 => 556, 52 => 556, 53 => 556, 54 => 556, 55 => 556, 56 => 556, 57 => 556, 58 => 278, 59 => 278, 60 => 584, 61 => 584, 62 => 584, 63 => 556, 64 => 1015, 65 => 667, 66 => 667, 67 => 722, 68 => 722, 69 => 667, 70 => 611, 71 => 778, 72 => 722, 73 => 278, 74 => 500, 75 => 667, 76 => 556, 77 => 833, 78 => 722, 79 => 778, 80 => 667, 81 => 778, 82 => 722, 83 => 667, 84 => 611, 85 => 722, 86 => 667, 87 => 944, 88 => 667, 89 => 667, 90 => 611, 91 => 278, 92 => 278, 93 => 278, 94 => 469, 95 => 556, 96 => 222, 97 => 556, 98 => 556, 99 => 500, 100 => 556, 101 => 556, 102 => 278, 103 => 556, 104 => 556, 105 => 222, 106 => 222, 107 => 500, 108 => 222, 109 => 833, 110 => 556, 111 => 556, 112 => 556, 113 => 556, 114 => 333, 115 => 500, 116 => 278, 117 => 556, 118 => 500, 119 => 722, 120 => 500, 121 => 500, 122 => 500, 123 => 334, 124 => 260, 125 => 334, 126 => 584, 161 => 333, 162 => 556, 163 => 556, 164 => 167, 165 => 556, 166 => 556, 167 => 556, 168 => 556, 169 => 191, 170 => 333, 171 => 556, 172 => 333, 173 => 333, 174 => 500, 175 => 500, 177 => 556, 178 => 556, 179 => 556, 180 => 278, 182 => 537, 183 => 350, 184 => 222, 185 => 333, 186 => 333, 187 => 556, 188 => 1000, 189 => 1000, 191 => 611, 193 => 333, 194 => 333, 195 => 333, 196 => 333, 197 => 333, 198 => 333, 199 => 333, 200 => 333, 202 => 333, 203 => 333, 205 => 333, 206 => 333, 207 => 333, 208 => 1000, 225 => 1000, 227 => 370, 232 => 556, 233 => 778, 234 => 1000, 235 => 365, 241 => 889, 245 => 278, 248 => 222, 249 => 611, 250 => 944, 251 => 611}
      }
    }

  end
end
