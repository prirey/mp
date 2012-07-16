package masterproject.machinelearning;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.javaml.core.Dataset;
import net.sf.javaml.core.DefaultDataset;
import net.sf.javaml.distance.PearsonCorrelationCoefficient;
import net.sf.javaml.featureselection.FeatureScoring;
import net.sf.javaml.featureselection.ensemble.LinearRankingEnsemble;
import net.sf.javaml.featureselection.ranking.RecursiveFeatureEliminationSVM;
import net.sf.javaml.featureselection.scoring.GainRatio;
import net.sf.javaml.featureselection.scoring.KullbackLeiblerDivergence;
import net.sf.javaml.featureselection.subset.GreedyForwardSelection;
import net.sf.javaml.tools.data.FileHandler;

public class TestFeatureSelection {

    public static void main(String[] args) throws IOException {
        //String filename = "/iris.data";
        String filename = "/UCI-small/wine/wine.data";
        int columnsIndex = 13;
        String deliminator = ",";
        Dataset data = readData(filename, columnsIndex, deliminator);
        /*
         * System.out.println("-----------------"); System.out.println("Feature
         * scoring"); System.out.println("-----------------"); scoring(data);
         * System.out.println("-----------------"); System.out.println("Feature
         * ranking"); System.out.println("-----------------");
         * ranking(readData(filename, columnsIndex, deliminator));
         * System.out.println("-----------------"); System.out.println("Ensemble
         * feature ranking"); System.out.println("-----------------");
         * ensembleRanking(readData(filename, columnsIndex, deliminator));
         * System.out.println("-----------------"); System.out.println("Feature
         * subset selection"); System.out.println("-----------------");
         * subsetSelection(readData(filename, columnsIndex, deliminator));
         */
                
        filename = "./target/classes/output/TestFeatureSelection.data";
       /* String files;
        File folder = new File("./target");
        if(folder.isDirectory()) System.out.println("Directory exists"); 
        String[] listOfFiles = folder.list();

        for (int i = 0; i < listOfFiles.length; i++) {

                System.out.println(listOfFiles[i]);
        }*/
        FileHandler.exportDataset(data, new File(filename));
        


    }

    private static Dataset readData(String filename, int columns, String deliminator) {
        File f = new File(TestFeatureSelection.class.getResource(filename).getPath());
        if (f.exists()) {
            System.out.println("File exists");
        } else {
            System.out.println("File doesn't exist");
        }
        try {
            return FileHandler.loadDataset(new File(TestFeatureSelection.class.getResource(filename).getPath()), columns, deliminator);
        } catch (IOException ex) {
            Logger.getLogger(TestFeatureSelection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new DefaultDataset();
    }

    private static void scoring(Dataset data) {
        System.out.println("Gain ratio");
        processFeatureScoring(data, new GainRatio());
        System.out.println("Kullback leibler divergence");
        processFeatureScoring(data, new KullbackLeiblerDivergence());
    }

    private static void processFeatureScoring(Dataset data, FeatureScoring fs) {

        /*
         * Apply the algorithm to the data set
         */
        fs.build(data);
        /*
         * Print out the score of each attribute
         */
        for (int i = 0; i < fs.noAttributes(); i++) {
            System.out.println(fs.score(i));
        }


    }

    private static void ranking(Dataset data) {
        RecursiveFeatureEliminationSVM svmrfe = new RecursiveFeatureEliminationSVM(0.2);
        /*
         * Apply the algorithm to the data set
         */
        svmrfe.build(data);
        /*
         * Print out the rank of each attribute
         */
        for (int i = 0; i < svmrfe.noAttributes(); i++) {
            System.out.println("Feature " + i + " has rank " + svmrfe.rank(i));
        }



    }

    private static void ensembleRanking(Dataset data) {

        RecursiveFeatureEliminationSVM[] svmrfes = new RecursiveFeatureEliminationSVM[10];
        for (int i = 0; i < svmrfes.length; i++) {
            svmrfes[i] = new RecursiveFeatureEliminationSVM(0.2);
        }
        LinearRankingEnsemble ensemble = new LinearRankingEnsemble(svmrfes);
        /*
         * Build the ensemble
         */
        ensemble.build(data);

        for (int j = 0; j < ensemble.noAttributes(); j++) {
            System.out.println("Feature " + j + " has rank " + ensemble.rank(j));
        }
    }

    private static void subsetSelection(Dataset data) {
        System.out.println("Greedy forward selection: select one 'the best' feature");
        GreedyForwardSelection ga = new GreedyForwardSelection(1, new PearsonCorrelationCoefficient());

        ga.build(data);
        System.out.println(ga.selectedAttributes());
    }
}
