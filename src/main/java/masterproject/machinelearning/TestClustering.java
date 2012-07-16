package masterproject.machinelearning;

import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.javaml.clustering.Clusterer;
import net.sf.javaml.clustering.DensityBasedSpatialClustering;
import net.sf.javaml.clustering.KMeans;
import net.sf.javaml.clustering.evaluation.ClusterEvaluation;
import net.sf.javaml.clustering.evaluation.SumOfCentroidSimilarities;
import net.sf.javaml.clustering.evaluation.SumOfSquaredErrors;
import net.sf.javaml.core.Dataset;
import net.sf.javaml.tools.data.FileHandler;
/**
 * Hello world!
 *
 */
public class TestClustering 
{
   
    public static void main( String[] args ) throws IOException 
    {
        String filename = "/iris.data";
    Dataset data = readData(filename);
    
    //other clustering algorithm available (see at http://java-ml.sourceforge.net/api/0.1.7/)
    Dataset[] clusters1 = processKMeansClustering(data);
    Dataset[] clusters2 = processDensityBasedClustering(data);
    evaluateSquaredErrors(clusters1);
    evaluateSquaredErrors(clusters1);
    evaluateSumOfCentroidSimilarities(clusters1);
    evaluateSumOfCentroidSimilarities(clusters2);
    FileHandler.exportDataset(data,new File("outputTestFeatureSelection.data"));
    }
    
    private static Dataset readData(String filename){
        File f = new File(TestClustering.class.getResource(filename).getPath());
        if(f.exists())
            System.out.println("File exists");
        try {
            return FileHandler.loadDataset(new File(TestClustering.class.getResource(filename).getPath()), 4, ",");
        } catch (IOException ex) {
            Logger.getLogger(TestClustering.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    
    }
    
    private static Dataset[] processKMeansClustering(Dataset data) {
        /* Create a new instance of the KMeans algorithm, with no options
      * specified. By default this will generate 4 clusters. */
    Clusterer km = new KMeans();
    /* Cluster the data, it will be returned as an array of data sets, with
      * each dataset representing a cluster. */
    Dataset[] clusters = km.cluster(data);
    return clusters;
    
    }
    

    private static Dataset[] processDensityBasedClustering(Dataset data) {
    
    Clusterer dbsc = new DensityBasedSpatialClustering();
    /* Perform clustering */
    Dataset[] clusters = dbsc.cluster(data);
    return clusters;
    }
    
    private static void evaluateSquaredErrors(Dataset[] clusters){
        /* Create a measure for the cluster quality */
ClusterEvaluation sse= new SumOfSquaredErrors();
/* Measure the quality of the clustering */
double score=sse.score(clusters);
        System.out.println("Score(clustering quality:"+score);
        
    }
    private static void evaluateSumOfCentroidSimilarities(Dataset[] clusters){
        /* Create a measure for the cluster quality */
ClusterEvaluation sse= new SumOfCentroidSimilarities();
/* Measure the quality of the clustering */
double score=sse.score(clusters);
        System.out.println("Score(clustering quality:"+score);
        
    }
}
