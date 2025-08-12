puts 'Seeding database....'


information = Information.create!(
    [
        {
            title: "New Global Framework for AI Ethics Proposed by UN",
            main: "The United Nations General Assembly is currently debating a landmark resolution to establish a global framework for the ethical development and deployment of Artificial Intelligence. Key proposals include mandates for transparency in AI decision-making, bias mitigation requirements, and international cooperation on AI regulation to prevent autonomous weapon systems proliferation. This aims to set universal standards for AI governance.",
            user_id: 2
        },
        {
            title: "Discovery of Subterranean Ocean on Enceladus",
            main: "New data from a re-tasked deep-space probe suggests the existence of a vast, saltwater ocean beneath the icy crust of Saturn's moon Enceladus. The analysis of plumes emanating from its south pole indicates the presence of hydrothermal vents, raising the probability of habitable environments and the potential for extraterrestrial life. This discovery reshapes our understanding of potential life zones in the solar system.",
            user_id: 2
        },
        {
            title: "Sustainable Urban Farming Redefines Cityscapes",
            main: "Major cities like Singapore and Amsterdam are increasingly integrating vertical farms and rooftop hydroponic systems into their urban planning. These initiatives aim to drastically reduce carbon footprints by minimizing transport, conserving water through closed-loop systems, and improving food security for local populations. This trend is transforming previously underutilized urban spaces into productive agricultural hubs.",
            user_id: 2
        },
        {
            title: "Novel Gene Editing Technique Reverses Genetic Blindness",
            main: "A groundbreaking clinical trial has successfully used a new CRISPR-based gene editing technique to restore partial vision in patients suffering from inherited forms of blindness. Unlike previous methods, this technique targets a wider range of genetic mutations, offering hope for a broader patient population currently lacking effective treatments. Further trials are planned to confirm long-term efficacy and safety.",
            user_id: 1
        },
        {
            title: "Global Freshwater Scarcity Accelerates Desalination Innovation",
            main: "Regions experiencing severe drought are investing heavily in advanced desalination technologies. New membrane-based filtration systems are achieving up to 99% salt removal with 30% less energy consumption than older methods. This push for cost-effective freshwater production is critical as climate change exacerbates water stress worldwide. The goal is to provide sustainable access to potable water for vulnerable communities.",
            user_id: 2
        },
        {
            title: "Rise of Personalized Medicine through Genomic Data",
            main: "Pharmaceutical companies are increasingly leveraging large-scale genomic databases to develop highly personalized medications. By analyzing individual genetic profiles, new drugs can be tailored to target specific disease pathways, leading to more effective treatments with fewer side effects, particularly in oncology and rare disease management. This paradigm shift is moving away from 'one-size-fits-all' healthcare.",
            user_id: 2
        },
        {
            title: "Next-Generation Batteries Achieve Record Energy Density",
            main: "A research consortium has unveiled a prototype solid-state battery with an energy density surpassing current lithium-ion technology by 75%. This advancement promises to triple the range of electric vehicles and significantly extend the operating time of portable electronic devices, while also offering enhanced safety due to the absence of flammable liquid electrolytes. Commercialization is anticipated within five years.",
            user_id: 2
        },
        {
            title: "Ancient Mayan Civilization Used Advanced Water Filtration",
            main: "Archaeological findings in the heart of the Mayan lowlands have revealed sophisticated water filtration systems dating back over 2,000 years. These systems utilized natural zeolites and quartz crystal beds to purify water from reservoirs, demonstrating an advanced understanding of hydrology and environmental engineering far ahead of their time. This challenges previous assumptions about ancient technologies.",
            "user_id": 2
        },
        {
            title: "New Framework for Detecting Deepfake Audio with AI",
            main: "Researchers at Stanford University have developed a novel AI-powered detection system that can identify deepfake audio recordings with over 95% accuracy. The system analyzes subtle vocal nuances and inaudible spectral inconsistencies that are typically missed by human listeners, providing a crucial tool in the fight against misinformation and synthetic media manipulation. This tool is vital for safeguarding online communication and digital forensics.",
            user_id: 1
        }
    ]
)
puts "Seeding completed!!!!"
