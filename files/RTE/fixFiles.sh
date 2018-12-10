#ssconvert eCO2mix_RTE_Annuel-Definitif_2017.xls eCO2mix_RTE_Annuel-Definitif_2017.csv
#cp eCO2mix_RTE_Annuel-Definitif_2017.csv eCO2mix_RTE_Annuel-Definitif_2017_modif.csv
#sed -i 'y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/' eCO2mix_RTE_Annuel-Definitif_2017_modif.csv
#awk '{a = $0; gsub(" ","",a); gsub("\.","",a); if(NR==1) {gsub("\-","",a)}; gsub("\"", "", a); gsub("\?","",a); gsub("\+","",a); gsub("HydrauliqueFildeleaueclusee", "HydrauliqueFilEauPlusEcluses", a); gsub("Echcomm", "EchComm", a); gsub("Echphy", "EchPhy", a); if($3 != "pourra"){print a}}' eCO2mix_RTE_Annuel-Definitif_2017_modif.csv > eCO2mix_RTE_Annuel-Definitif_2017_modif_fixed.csv
    
fixFile () {
    filexls=$1
    filecsv=`awk -v filexls="$1" 'BEGIN{filecsv=filexls; sub(".xls",".csv",filecsv); print filecsv}'`
    filecsvfixed=`awk -v filexls="$1" 'BEGIN{filecsvfixed=filexls; sub(".xls","_fixed.csv",filecsvfixed); print filecsvfixed}'`
    echo $filexls "->" $filecsv 
    ssconvert $filexls $filecsv
    echo $filecsv "->" $filecsvfixed
    cp $filecsv $filecsvfixed
    sed -i 'y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuüüüüAAAAEEEEIIIIOOOOUUUUÜÜÜÜ/' $filecsvfixed
    awk '{a = $0; gsub(" ","",a); gsub("\.","",a); if(NR==1) {gsub("\-","",a)}; gsub("\"", "", a); gsub("\?","",a); gsub("\+","",a); gsub("HydrauliqueFildeleaueclusee", "HydrauliqueFilEauPlusEcluses", a); gsub("Echcomm", "EchComm", a); gsub("Echphy", "EchPhy", a); if($3 != "pourra"){print a}}' $filecsvfixed > temp.csv
    cp temp.csv $filecsvfixed
    rm temp.csv
}

fixFile eCO2mix_RTE_Annuel-Definitif_2012.xls
fixFile eCO2mix_RTE_Annuel-Definitif_2013.xls
fixFile eCO2mix_RTE_Annuel-Definitif_2014.xls
fixFile eCO2mix_RTE_Annuel-Definitif_2015.xls
fixFile eCO2mix_RTE_Annuel-Definitif_2016.xls
fixFile eCO2mix_RTE_Annuel-Definitif_2017.xls
