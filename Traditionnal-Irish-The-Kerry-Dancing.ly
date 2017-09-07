\version "2.18.2"

%%%%%% fontctions 
mBreak = { \break } % pour faire des sauts de ligne dans la partition. avec \mBreak

\include "definitions.ily"

%%%%% 

\header {
  title = "The Kerry Dancing"
  composer = "Traditionnal Irish"
  arranger = "J.P. Poly"
  tagline = \markup {
    Engraved at
    \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    with \with-url #"http://lilypond.org/"
    \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
  }
}
melody  = \relative c' {
  \clef treble
  \key f \major
  \time 6/8
  f4 g8 a8. g16 f8  | bes4 d8 c4 a8 |f'4 a,8 a8. g16 f8 | c4 d8 e4 r8 |
  f4 g8 a8. g16 f8  | bes4 d8 c4 a8 |f'4 a,8 a8. g16 f8 | g4 d8 d4 r8 |
  
  c'4 d8 c4 d8 | c4 d8 c4 d8 | c4 d8 e8. d16 c8 | d4 a8 b4. |
  c4 d8 c4 d8  | c4 d8 c4 d8 | c4 d8 e8  d8 c8  | d4 a8 b4. |
  
  f'4 d8 bes8. c16 d8 | e4 c8 a8. bes16 c8 | d4 g,8 bes4 g8  |g4. r4 r8 |
}

paroles = \lyricmode {  %cant be called lyrics
   Oh, the days of the ker- ry danc- ing! 
   Oh, the ring of the pi- per's tune!
   Oh, for one of those hours of glad- ness, 
   Gone, a- las, like our youth too soon.
   When the boys be- gan to gath- er 
   in the glen of a sum- mer night,
   And the Ker- ry pi- per's tun- ing 
   made us long _ with wild de- ligth 
   Oh, think of it ! Oh, to dream of it fills my heart with  tears. 
}


upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  a4 b c d
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  a2 c
}

clarinetMusic =  \relative c' {
\key f \major
\time 6/8
f4 g8 a8. g16 f8  | bes4 d8 c4 a8 |f'4 a,8 a8. g16 f8 | c4 d8 e4 r8 |
f4 g8 a8. g16 f8  | bes4 d8 c4 a8 |f'4 a,8 a8. g16 f8 | g4 d8 d4 r8 |

c'4 d8 c4 d8 | c4 d8 c4 d8 | c4 d8 e8. d16 c8 | d4 a8 b4. |
c4 d8 c4 d8  | c4 d8 c4 d8 | c4 d8 e8  d8 c8  | d4 a8 b4. |

f'4 d8 bes8. c16 d8 | e4 c8 a8. bes16 c8 | d4 g,8 bes4 g8  |g4. r4 r8 |
}


\score {
  <<
    \new Voice = "mel" { \autoBeamOff \melody }
    \new Lyrics \lyricsto mel \paroles
    \new PianoStaff <<
      \new Staff = "upper" \upper
      \new Staff = "lower" \lower
    >>
    \new Staff = "Staff_clarinet" {
        \set Staff.instrumentName =
        \markup { \concat { "Clar. B " \flat } }
        % Declare that written Middle C in the music
        %  to follow sounds a concert B flat, for
        %  output using sounded pitches such as MIDI.
        \transposition bes
        % Print music for a B-flat clarinet
        \transpose bes c' \clarinetMusic
    }
  >>
  \layout {
%  \context {
%    \Voice
%    \consists "Ambitus_engraver"
%  }
  \context { \Staff \RemoveEmptyStaves }
}
\midi { }
}

% ssid  Victoire mdp ratatouille1906