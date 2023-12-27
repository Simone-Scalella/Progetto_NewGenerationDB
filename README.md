# Progetto per il corso di new generation database. Anno accademico 2022-2023

Il testo seguente è un riepilogo generale sul lavoro svolto per il progetto del corso di new generation database 2022-2023. Per ulteriori approfondimenti e chiarimenti si invita a consultare la relazione completa disponibile al seguente [link](https://github.com/Simone-Scalella/Progetto_NewGenerationDB/blob/main/Progetto_di_new_generation_database.pdf).

## Obiettivi del progetto
Questo progetto prevede diversi obiettivi, che sono lo studio e la comprensione dell’architettura OBDF, replicazione dei risultati proposti nell’articolo e scrittura di nuove query.

### Workflow
Di seguito riportiamo il workflow seguito per la realizzazione di tale progetto.

1. Implementazione dell’architettura: Durante questa fase si è iniziato con lo studio dell’architettura presentata nell’articolo. Successivamente, utilizzando le linee guida presenti su github e varie documentazioni si è riusciti a risolvere diversi problemi e a implementare tutta l’architettura.
2. Esecuzione delle query: Durante questa fase si è proceduto a mandare in esecuzione le query proposte nell’articolo, risolvendo i problemi d’esecuzione che si sono presentati.
3. Esecuzione delle nuove query: Durante questa fase si è proceduto con un’operazione di reverse engineering e si è studiata l’architettura per poter realizzare delle nuove interrogazioni.
4. Esecuzione delle query modificate: Durante questa fase si è proceduto con la modifica di alcune delle interrogazioni proposte dagli autori dell’articolo per testare ulteriormente l’efficienza delle ottimizzazioni.

### Sintesi dell'articolo
Il seguente progetto si basa sullo studio e la ricerca proposti nell’articolo Ontologybased Data Federation – A Framework Proposal. Per comprendere a pieno il lavoro svolto in questo progetto è necessario fare un breve riassunto dell’articolo. Per ulteriori approfondimenti si invita a consultare l’articolo originale, il cui link viene riportato nel capitolo successivo. In questo articolo viene formalmente introdotta la nozione di federazione dei dati basata su ontologie (OBDF) per denotare un framework che combina ontologybased-data-access (OBDA) con un livello di federazione dei dati in cui più fonti eterogenee sono virtualmente esposte come un singolo database relazionale. Vengono proposte nuove tecniche per rendere più efficiente la risposta alle query.

Queste tecniche sono convalidate attraverso un’ampia valutazione sperimentale. L’ottimizzazione delle query in OBDF si basa sul fatto che l’ontologia e le mappaturre contengono informazioni per guidare l’utilizzo dei suggerimenti (hint) sui dati. La procedura di ottimizzazione si compone di due fasi, nella prima abbiamo una parte di precalcolo dei suggerimenti offline e nella seconda abbiamo un’ottimizzazione online della traduzione. L’utilizzo dei suggerimenti permette di eliminare operazioni inutili e ridonti, che sono join vuoti, unioni ridondanti, sostituzione di join e join esterni con espressioni, infine, la sostituzione dei join federati nelle query sql in richieste su viste materializzate. Questo lavoro introduce all’impostazione dei sistemi OBDF e studia il problema dell’ottimizzazione delle query.

![Immagine](https://github.com/Simone-Scalella/Progetto_NewGenerationDB/blob/main/image/architettura.png)

## Sviluppo del progetto

###  Implementazione dell’architettura

La prima fase di questo progetto ha previsto un’operazione di fork del progetto caricato sul sito github dagli autori dell’articolo. Si è proceduto, utilizzando le linee guida per l’installazione presenti nella repository del progetto, a eseguire le operazioni necessarie per implementare l’architettura.
Successivamente, si è aperto il terminale di windows, selezionando la directory experimentsset-up-docker come directory di lavoro. Successivamente, si è proceduto a eseguire il comando:
```
./ bin / generate - data scale
```
Per poter eseguire questi script su windows si è dovuti procedere a modificare l’estensione di tutti questi file in nome file.sh, altrimenti, il sistema operativo non è in grado di eseguirli e dà errore. L’esecuzione di questo comando ha portato alla risoluzione di una seconda problematica. Infatti, questo è un file.sh, e tutti i file .sh che erano presenti all’interno del progetto avevano come impostazione della sequenza di fine riga il valore CTLF, questo in windows genera un problema, in quanto non è in grado di leggere correttamente i token, cioè, i simboli presenti in questo file. Utilizzando VScode si è proceduto a cambiare il valore dell’impostazione di tutti i file .sh in LF.

Al termine dell’esecuzione del comando vengono creati tutti i dati utilizzati dall’architteura. L’esecuzione di questo comando richiede molto tempo, inoltre, è stato necessario controllare i dati generati, in quanto alcuni elementi possono essere generati male e risultano corroti. Successivamente, si è proceduto con la crezione del documento di configurazione per docker, utilizzando il comando:
```
cp . env . example . env
```
Questo file è molto importante, al suo interno sono presenti due voci, nelle quali bisogna specificare i nomi dei container che devono essere istanziati e la dimensione del dataset con cui si vuole lavorare.

Per avviare l’applicazione, scaricando le immagini e i contenitori richiesti bisogna eseguire il comando:
```
docker - compose up
```
Nel docker file sono presenti dei profili, che vengono assegnati a uno o più container per gestirli. I profili hom ed het utilizzano diverse risorse, mentre, il profilo sc1 ed sc2 utilizzano una sola risorsa. La differenza tra i profili hom ed het è che in hom le risorse utilizzate sono omogenee, cioè, implementate con lo stesso software, invece, in het le risorse sono eterogenee, cioè, implementate con software diversi. Le operazioni di ottimizzazione sono applicate solo sulle query per i profili hom ed het, e vengono salvate nella directory hom/het-opt quelle ottimizzate, invece, quelle ottimizzate con viste materializzate sono salvate nella directory hom/het-opt-matv.

All’interno di docker sono presenti i seguenti container:

1. Il container Sc1 rappresenta una base di dati centralizzata. Al suo interno sono contenute diverse entità legate da varie relazioni.
2. Il container Sc2 rappresenta una base di dati centralizzata. Al suo interno sono contenute le stesse informazioni presenti in Sc1, cambia lo schema, quindi, ci sono entità diverse e relazioni diverse. Ad esempio l’entità Product presente in Sc1 viene rappresentata con due entità dentro Sc2, che sono Product1 e Product2.
3. Il container Source-smatv contiene le viste materializzate usate per fare le ottimizzazioni.
4. I container source-s1, source-s2, source-s3, source-s4, source-s5 e sources2p contengono dei frammenti della base di dati Sc1. Infatti, al loro interno sono presenti solo due o tre entità legate da una o due relazioni.
5. I container teiid-hom e teiid-het contengono al loro interno il software Teiid. Questo software permette di eseguire delle interrogazioni su database virtuali e di accedere ai dati in modo federato. Un database virtuale è un artefatto che combina una o più sorgenti di dati per garantire una facile integrazione dei dati. L’integrazione è incapsulata attraverso viste e procedure che Teiid elaborerà in modo ottimizzato rispetto alle fonti.
6. I container ontop-sc1, ontop-sc2, ontop-hom e ontop-het contengono l’applicazione ontop, che rappresenta lo strato obda (ontology based data access) utilizzato dall’architettura.

### Risoluzione dei problemi di docker

Per istanziare tutti i container si è dovuto risolvere un problema nel file dockercompose, in quanto alcuni path per utilizzare dei file erano sbagliati. Si è proceduto alla risoluzione del problema aggiornando i path. Una volta istanziati tutti i container si è osservato un altro problema, in quanto tutti i container ontop si riavviavano continuamente. Studiando il file docker-compose sono emersi una serie di errori. Si è osservato che questi container utilizzavano un file chiamato entrypoint, che non era presente nella directory di lavoro.

Tale file veniva utilizzato in maniera analoga da altri container, quindi, per risolvere il problema si è proceduto a copiare il file mancante all’interno della cartella utilizzata dai container ontop. Un altro problema che si è dovuto risolvere è stato quello relativo ai path di alcuni file dei container ontop dentro il file docker-compose, infatti, tali path erano sbagliati e facevano riferimento a delle directory che non esistevano.

Aggiornando i path si è riusciti a risolvere il problema dei container ontop. Infatti, dopo queste operazioni si osserva che i container smettevano di riavviarsi continuamente.

### Esecuzione di una singola query

Una volta avviata l’architettura si proceduti a eseguire una singola query, per verificare che tutti i container funzionassero correttamente. Si proceduti con l’esecuzione di una query e l’esito è stato negativo, erano presenti dei problemi che non permettevano alla query di essere eseguita correttamente. Per eseguire una query bisogna utilizzare il file tester.sh utilizzando il seguente comando:

```
sudo bash -c " source tester . sh ; sc1 "
```

Tale comando deve essere eseguito su terminale Ubuntu, utilizzando come directory di lavoro la stessa dov’è presente il file tester.sh. All’interno del comando, dopo il simbolo ‘;‘ viene passato come argomento il nome della funzione da mandare in esecuzione, infatti, al suo interno sono presenti tante funzioni quante sono le directory contenenti le query sql.
Una volta lanciato il comando viene utilizzato uno specifico file di configurazione, chiamato configuration-sc1.conf, il nome di tale file varia a seconda della funziona che viene chiamata perchè lavora su una directory diversa. All’interno di questo file sono presenti molte informazioni, tra cui nome utente e password con cui collegarsi alla sorgente, gli indirizzi, la directory all’interno della quale trovare tutte le query sql da eseguire, e altre informazioni. Una volta lanciato il comando vengono eseguite tutte le query presenti nella directory specificata dal file di configurazione.

Un primo problema che si è dovuto risolvere era dovuto al fatto che all’interno dei file di configurazione, alcuni indirizzi delle risorse erano sbagliati, e questo causava errori durante l’esecuzione delle query. Sistemati gli indirizzi ci si è accorti che era presente una seconda problematica. All’interno della cartella mancavano dei file di configurazione utilizzati da alcune funzioni, che erano configuration-sc2.conf e configurationhom-opt-matv.conf. Per ricostruire tali file sono state utilizzate le informazioni presenti negli altri file di configurazioni che non cambiavano mai, mentre, per gli indirizzi delle sorgenti sono stati utilizzati quelli presenti nel file docker-compose. Sistemati questi problemi l’esecuzione della funzione termina con esito positivo e le query generano dei risultati.

### Esecuzione delle query

All’interno della repository dell’articolo sono presenti le query scritte nel liguaggio sparql dagli autori dell’articolo e le corrispondenti query già tradotte e ottimizzate in linguaggio sql. Come prima cosa si è proceduto a verificare che le interrogazioni in sparql venissero tradotte correttamente nelle corrispondenti interrogazioni in sql. Questa verifica è stata fatta per i profili sc1, sc2, hom ed het. Si è proceduto a utilizzare il terminale di Docker-desktop, che permette di comunicare con i container, per inserire all’interno del terminale dei container ontop le query da convertire. Il container produce il risultato che riportiamo nella seguente figura. La query in linguaggio sql è evidenziata.

![Immagine2](https://github.com/Simone-Scalella/Progetto_NewGenerationDB/blob/main/image/traduzione%20SPARQL/00het.png)

Le interrogazioni prodotte da ontop partono dalla parola Native. Per poter essere utilizzate devono essere rimossi tutti i caratteri \ e bisogna sostituire i caratteri \n con la newline. Una volta pulito il testo quello che si ottiene è l’interrogazione che deve essere salvata come file .sql. Al termine dell’operazione si è verificato che tutte le query, scritte in sparql, presenti nel progetto venivano tradotte correttamente nelle corrispondenti query sql.

### Utilizzo degli script per eseguire le query

L’esecuzione di una funzione del file tester.sh genera due risultati. Il primo file si chiama mixer-stats- e dopo il trattino viene inserito il nome della funzione che è stata eseguita. Al suo interno vengono riportati eventuali errori, tempo di esecuzione delle query e numero di risultati ottenuti. Di seguito carichiamo un esempio di questo file. Il secondo file si chiama mixer-out- e dopo il trattino viene inserito il nome della funzione che è stata eseguita. Al suo interno vengono riportati possibili errori che si verificano durante l’esecuzione delle query e vengono riportate le query che alla fine vengono eseguite sulle risorse. Infatti, nelle query che vengono mandate in esecuzione sono presenti dei placeholder, come ad esempio $1:product.nr:percent, esso viene sostituito durante l’esecuzione della query dal valore corrispondente. Di seguito riportiamo un esempio di file mixer-out. Dopo che si è eseguita una funzione, è necessario eseguire il programma java ResultToCSV.java usando il comando:
```
java ResultToCSV
```
Tale programma calcola il tempo di esecuzione medio, per ogni query e per ogni profilo di lavoro, e lo inserisce all’interno di un file .csv, che sarà rinominato con la dimensione del dataset utilizzato. Si è proceduto a realizzare dei nuovi file che rendessero più automatica l’esecuzione delle funzioni e del file ResultToCSV. Sono stati realizzati due nuovi file che sono alltest.sh e ResultToCSVfull. Il primo file permette di chiamare in maniera sequenziale tutte le funzioni del file tester.sh, in maniera tale da non doverle chiamare singolarmente; il secondo file, invece, permette di eseguire le operazioni del file ResultToCSV direttamente su tutti i dataset, altrimenti, ogni volta bisognava cambiare il path, ricompilare il nuovo file ed eseguirlo.

![Immagine3](https://github.com/Simone-Scalella/Progetto_NewGenerationDB/blob/main/image/mixer-stat.png)

## Esecuzione delle nuove query

In questa fase del progetto si vogliono realizzare delle nuove query per testare ulteriormente l’architettura.

### Reverse engineering degli schemi

Per poter scrivere delle nuove query è necessario comprendere a pieno lo schema dei dati, quindi, si è proceduto con una fase di reverse engineering del codice sql con il quale sono state implementate le basi di dati sulle singole sorgenti. Leggendo il codice sql delle chiavi esterne si sono potute ricostruire le relazioni che legano tra loro le varie entità. Riportiamo di seguito un esempio contenente gli schemi e-r ottenuti durante questa fase.

![Immagine4](https://github.com/Simone-Scalella/Progetto_NewGenerationDB/blob/main/image/er/hom_het.drawio.png)

### Scrittura delle nuove interrogazioni

Durante questa fase del progetto si sarebbero dovute scrivere delle nuove query, per verificare se scrivendo interrogazioni diverse da quelle proposte si osservavano delle differenze nei tempi di esecuzione tra quelle ottimizzate, e ottimizzate con viste materializzate e quelle normali, senza ottimizzazione. Purtroppo, gli autori dell’articolo non hanno rilasciato i container contenenti gli algoritmi di ottimizzazione.

La componente di ottimizzazione non è disponibile in quanto non è funzionante. Gli autori dell’articolo hanno ottimizzato un insieme di query, applicando ‘a mano‘ i loro algoritmi, e la sperimentazione riguarda il mostrare che le ottimizzazioni danno effettivamente risultati migliori in fase di valutazione delle query. Tali informazioni non erano presenti all’interno dell’articolo, ma sono state comunicate, successivamente, dagli autori dell’articolo. Di conseguenza si potevano tradurre query in sparql solo per i profili sc1, sc2, hom ed het, ma non è possibile tradurre le query per i profili hom/het dove sono presenti le ottimizzazioni e le ottimizzazioni con viste materializzate.

### Modifica delle query già esistenti

Come ultima fase del progetto si è deciso di verificare se le ottimizzazioni fossero ancora valide dopo aver modificato alcune condizioni delle interrogazioni. Per alcune query sono stati sostituiti i placeholder all’interno di alcune query con delle costanti dal valore più grande rispetto a quello originale. Modificando solo la condizione all’interno dell’istruzione where non andiamo a compromettere le ottimizzazioni fatte sulle query. Sono stati sostituiti i placeholder delle condizioni con simbolo di ‘¡=‘, in questo si appesantisce la query andando a considerare un numero maggiore di elementi. Per altre, invece, si è andati ad aggiungere delle nuove condizioni. In una si è proceduto a calcolare il resto della divisione per tre, tale condizione è vera solo se il resto è zero, quindi, quel valore è un multiplo di tre, e in un’altra interrogazione abbiamo aggiunto una condizione di LIKE, quindi, l’attributo come valore doveva contenere una certa sottostringa. La procedura per l’esecuzione di queste interrogazioni è analoga a quella precedente.

## Risultati

I risultati ottenuti confermano le conclusioni formulate dagli autori dell’articolo, infatti, dai risultati ottenuti durante questo progetto è possibile osservare come le query ottimizzate e ottimizzate con viste materializzate siano più veloci di quelle normali. Infine, si riportano i risultati ottenuti con l’esecuzione delle nuove interrogazioni. I risultati ottenuti mostrano come le query ottimizzate hanno dei tempi di esecuzione, che in generale, sono minori rispetto a quelle non ottimizzate, anche se lavorano con risultati di dimensioni maggiori.

Le query ottimizzate su viste materializzate e una condizione aggiuntiva nel where hanno, in alcuni casi, un tempo d’esecuzione maggiore rispetto alle altre. Questo è dovuto al fatto che le ottimizzazioni presenti sulle query di partenza erano state prodotte in modo offline, e cioè, utilizzando un algoritmo di ottimizzazione dell'interrogazione che non è stato reso disponibile.
Modificando la query ottimizzata, aggiungendo o cambiando delle condizioni, si va, a perdere parte dell'ottimizzazione, quindi, i risultati, in alcuni casi sono peggiori. Solo in alcuni casi, perchè, comunque, molte sorgenti hanno sistemi di ottimizzazione interni, i quali, a volte, riescono a compensare la modifica della query. 

## Conclusioni e sviluppi futuri

Quando saranno disponibili le componenti per l’ottimizzazione, si potrà riprendere la fase di questo progetto relativa alla scrittura di nuove query, in maniera tale da testare le capacità di ottimizzazione del sistema in maniera più approfondita e per comprendere al meglio pregi e difetti di questa architettura.

In conclusione, i risultati che abbiamo ottenuto sono analoghi a quelli che hanno ottenuto gli autori dell’articolo, quindi, le ottimizzazioni implementate rendono la valutazione delle query effettivamente più veloce. L’ottimizzazione viene effettuata nel primo livello dell’architettura, quello rappresentato da obda. Durante la fase di traduzione applica gli hint per ottimizzare, con e senza viste materializzate, la query. Purtroppo, non si è potuto testare ulteriormente tale meccanismo. La traduzione delle query sparql è chiara ed è applicabile per ottenere delle query che possono essere mandate in esecuzione sugli altri container.
