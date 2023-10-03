import random

eleves = [
    "arthur",
    "pierre",
    # "marvin",
    "max",
    "charlotte",
    # "naïm",
    "abdessamed",
    "fabien",
    "lionel",
    "boris",
    "cédric",
    "jonathan",
    "joachim",
    "mhoudini",
    "ilham",
    "salah",
    "aldrin"
]


def def_groups(person_list:list, size:int, bigger_groups:bool=True):
    """ 
    définir des groupes alatoires d’une taille donnée
    le paramètre optionnel "bigger_groups" définit comment répartir les personnes
    en trop pour que les groupes soient de taille égales : à true, certains groupes auront 
    une personne de plus, à false un nouveau groupe plus petit sera crée
    """ 

    #créer le dictionnaire de groupes
    groups:dict[str, list] = {}
    grp_number = len(person_list)//size
    groups_avaliable = []
    additional_persons = len(person_list) % size
    for n in range(grp_number):
        groups[f"group_{n+1}"] = []
        groups_avaliable.append(n+1)
    
    # préparation à la gestion des personnes additionnelles si ça ne tombe pas juste
    if additional_persons != 0 :
        if bigger_groups == False :
            groups[f"group_{grp_number+1}"] = []
            groups_avaliable.append(grp_number+1)
        else : 
            additional_persons_groups = random.sample(groups_avaliable, additional_persons)

    #remplir les groupes
    for person in person_list :
        if groups_avaliable != [] :
            target_grp = random.choice(groups_avaliable)
            groups[f"group_{target_grp}"].append(person)
            if len(groups[f"group_{target_grp}"]) == size : groups_avaliable.remove(target_grp)
        elif bigger_groups == True :
            for n in additional_persons_groups : groups[f"group_{n}"].append(person)
            
    return groups
        
groups3 = def_groups(eleves, 3, False)

for k,v in groups3.items() :
    print(k,' : ',v)
