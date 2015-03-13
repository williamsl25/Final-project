task create_programs: :environment do
  puts "5 programs created"
    Program.create!({
      name: 'Earobics',
      focus: 'Phonemic Awareness',
      description: 'The ability to notice, think about, or manipulate the individual phonemes
(sounds) in words. It is the ability to understand that sounds in spoken language work together to
make words. This term is used to refer to the highest level of Phonological Awareness: awareness of
individual phonemes in words. ', 
    })
    Program.create!({
      name: 'Corrective Reading',
      focus: 'Alphabetic Principle',
      description: 'The concept that letters and letter combinations represent
individual phonemes in written words.', 
    })
    Program.create!({
      name: 'Read Naturally',
      focus: 'Oral Reading Fluency',
      description: 'The ability to read text quickly, accurately, and with proper expression. Fluency
provides a bridge between word recognition and comprehension. ', 
    })
    Program.create!({
      name: 'Accelerated Vocabulary',
      focus: 'Vocabulary',
      description: 'Planned instruction to pre-teach new, important, and
difficult words to ensure the quantity and quality of exposures to words that students will
encounter in their reading. ', 
    })
    Program.create!({
      name: 'Comprehension Plus',
      focus: 'Comprehension',
      description: 'Comprehensive Intervention Programs
include instructional content based on the five essential components of reading instruction integrated into a coherent instructional design. A coherent design includes
explicit instructional strategies, coordinated instructional sequences, ample practice
opportunities and aligned student materials. Comprehensive Intervention Programs
provide instruction that is more intensive, explicit, systematic, and more motivating than
instruction students have previously received. These programs also provide more
frequent assessments of student progress and more systematic review in order to insure
proper pacing of instruction and mastery of all instructional components. ', 
    })
  end
