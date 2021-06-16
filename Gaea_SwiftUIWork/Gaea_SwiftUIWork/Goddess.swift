//
//  Goddess.swift
//  Gaea_SwiftUIWork
//
//  Created by 임현지 on 2021/06/15.
//

import SwiftUI

struct Goddess: Identifiable {
    let name: String
    let image: URL
    let headDescription: String
    let description: String
    let footerImage: URL?
    let fotterImageDescription: String?
    let type: Type
    var id = UUID()
}

enum Type: String {
    case olympus
    case other
}

//var goddess: [Goddess] = [
//    Goddess(name: "Demeter",
//            image: Image("Ceres_Hendrick Goltzius"),
//            headDescription: "Olympian goddess of the harvest and agriculture, presiding over grains and the fertility of the earth.",
//            description: "In ancient Greek religion and mythology, Demeter is the Olympian goddess of the harvest and agriculture, presiding over grains and the fertility of the earth. She was also called Deo. Her cult titles include Sito, 'she of the Grain', as the giver of food or grain, and Thesmophoros, 'giver of customs' and/or 'legislator', in association with the secret female-only festival called the Thesmophoria.\nThough Demeter is often described simply as the goddess of the harvest, she presided also over the sacred law, and the cycle of life and death. She and her daughter Persephone were the central figures of the Eleusinian Mysteries, a religious tradition that predated the Olympian pantheon, and which may have its roots in the Mycenaean period c. 1400–1200 BC.\nDemeter was often considered to be the same figure as the Anatolian goddess Cybele, and she was identified with the Roman goddess Ceres.",
//            footerImage: Image("Jacob Jordaens_Ofrenda a Ceres"),
//            fotterImageDescription: "Jacob Jordaens <Ofrenda a Ceres>",
//            type: .olympus),
//    
//    Goddess(name: "Artemis",
//            image: Image("Peter Paul Rubens_Diana cazadora"),
//            headDescription: "Artemis is the Greek goddess of the hunt, the wilderness, wild animals, the Moon, and chastity. The goddess Diana is her Roman equivalent.",
//            description: "Artemis is the daughter of Zeus and Leto, and the twin sister of Apollo. She was the patron and protector of young girls, and was believed to bring disease upon women and relieve them of it.\nArtemis was worshipped as one of the primary goddesses of childbirth and midwifery along with Eileithyia. Much like Athena and Hestia, Artemis preferred to remain a maiden and is sworn never to marry.\nArtemis was one of the most widely venerated of the Ancient Greek deities, and her temple at Ephesus was one of the Seven Wonders of the Ancient World. Artemis' symbols included a bow and arrow, a quiver, and hunting knives, and the deer and the cypress were sacred to her. Diana, her Roman equivalent, was especially worshipped on the Aventine Hill in Rome, near Lake Nemi in the Alban Hills, and in Campania.",
//            footerImage: nil,
//            fotterImageDescription: nil,
//            type: .olympus),
//    
//    Goddess(name: "Venus",
//            image: Image("Cornelis Holsteyn_Venus de dood van Adonis bewenend"),
//            headDescription: "Aphrodite is an ancient Greek goddess associated with love, beauty, pleasure, passion and procreation.",
//            description: "Aphrodite was syncretized with the Roman goddess Venus. Aphrodite's major symbols include myrtles, roses, doves, sparrows, and swans. The cult of Aphrodite was largely derived from that of the Phoenician goddess Astarte, a cognate of the East Semitic goddess Ishtar, whose cult was based on the Sumerian cult of Inanna.\nAphrodite's main cult centers were Cythera, Cyprus, Corinth, and Athens. Her main festival was the Aphrodisia, which was celebrated annually in midsummer. In Laconia, Aphrodite was worshipped as a warrior goddess. She was also the patron goddess of prostitutes, an association which led early scholars to propose the concept of 'sacred prostitution' in Greco-Roman culture, an idea which is now generally seen as erroneous.",
//            footerImage: nil,
//            fotterImageDescription: nil,
//            type: .olympus),
//    
//    Goddess(name: "Amazones",
//            image: Image("Johann Georg_ Platzer Thalestris im Lager Alexander des Großen"),
//            headDescription: "Amazones were a group of female warriors and hunters, who matched men in physical agility and strength, in archery, riding skills and the arts of combat.",
//            description: "Courageous and fiercely independent, the Amazons, commanded by their queen, regularly undertook extensive military expeditions into the far corners of the world, from Scythia to Thrace, Asia Minor and the Aegean Islands, reaching as far as Arabia and Egypt. Besides military raids, the Amazons are also associated with the foundation of temples and the establishment of numerous ancient cities like Ephesos, Cyme, Smyrna, Sinope, Myrina, Magnesia, Pygela, etc.\nThe texts of the original myths envisioned the homeland of the Amazons at the periphery of the then known world. Various claims to the exact place ranged from provinces in Asia Minor (Lycia, Caria etc.) to the steppes around the Black Sea, or even Libya. However, authors most frequently referred to Pontus in northern Anatolia, on the southern shores of the Black Sea, as the independent Amazon kingdom where the Amazon queen resided at her capital Themiscyra, on the banks of the Thermodon river.",
//            footerImage: nil,
//            fotterImageDescription: nil,
//            type: .other)
//]
