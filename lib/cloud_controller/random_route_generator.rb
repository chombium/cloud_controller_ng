require 'set'

module VCAP::CloudController
  class RandomRouteGenerator
    ADJECTIVES = %w(accountable
                    active
                    agile
                    anxious
                    appreciative
                    balanced
                    bogus
                    boisterous
                    bold
                    boring
                    brash
                    brave
                    bright
                    busy
                    chatty
                    cheerful
                    chipper
                    comedic
                    courteous
                    daring
                    delightful
                    egregious
                    empathic
                    excellent
                    exhausted
                    fantastic
                    fearless
                    fluent
                    forgiving
                    friendly
                    funny
                    generous
                    grateful
                    grouchy
                    grumpy
                    happy
                    hilarious
                    humble
                    impressive
                    insightful
                    intelligent
                    industrious
                    interested
                    kind
                    lean
                    mediating
                    meditating
                    nice
                    noisy
                    optimistic
                    palm
                    patient
                    persistent
                    proud
                    quick
                    quiet
                    reflective
                    relaxed
                    reliable
                    resplendent
                    responsible
                    responsive
                    rested
                    restless
                    shiny
                    shy
                    silly
                    sleepy
                    smart
                    spontaneous
                    stellar
                    surprised
                    sweet
                    talkative
                    terrific
                    thankful
                    timely
                    tired
                    triumphant
                    turbulent
                    unexpected
                    wacky
                    wise
                    zany).freeze

    NOUNS = %w(aardvark
               alligator
               antelope
               armadillo
               baboon
               badger
               bandicoot
               bat
               bear
               bilby
               bongo
               bonobo
               buffalo
               bushbuck
               camel
               capybara
               cassowary
               cat
               cheetah
               chimpanzee
               chipmunk
               civet
               crane
               crocodile
               dingo
               dog
               dugong
               duiker
               echidna
               eland
               elephant
               emu
               fossa
               fox
               gazelle
               gecko
               gelada
               genet
               gerenuk
               giraffe
               gnu
               gorilla
               grysbok
               guanaco
               hartebeest
               hedgehog
               hippopotamus
               hyena
               hyrax
               impala
               jackal
               jaguar
               kangaroo
               klipspringer
               koala
               kob
               kookaburra
               kudu
               lemur
               leopard
               lion
               lizard
               llama
               lynx
               manatee
               mandrill
               marmot
               meerkat
               mongoose
               mouse
               numbat
               nyala
               okapi
               oribi
               oryx
               ostrich
               otter
               panda
               pangolin
               panther
               parrot
               platypus
               porcupine
               possum
               puku
               quokka
               quoll
               rabbit
               ratel
               raven
               reedbuck
               rhinocerous
               roan
               sable
               serval
               shark
               sitatunga
               springhare
               squirrel
               swan
               tiger
               topi
               toucan
               turtle
               vicuna
               wallaby
               warthog
               waterbuck
               whale
               wildebeest
               wolf
               wolverine
               wombat
               zebra).freeze

    def initialize
      @rand = Random.new
    end

    def route
      "#{ADJECTIVES[@rand.rand(ADJECTIVES.size)]}-#{NOUNS[@rand.rand(NOUNS.size)]}"
    end

    def seed(val)
      @rand = Random.new(val)
    end
  end
end
