package sentimentAnalysis.edu.utd;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class Aggregator{
public static void main(String[] args) throws Exception {
		try {
			String inputPath = args[0];
			String outputPath = args[1];

			Configuration conf = new Configuration();
			Job job = Job.getInstance(conf, "aggregator");

			/*
			 * // Delete the output directory if it exists already Path
			 * outputDir = new Path(outputPath);
			 * FileSystem.get(conf).delete(outputDir, true);
			 */

			job.setJarByClass(Aggregator.class);

			FileInputFormat.addInputPath(job, new Path(inputPath));
			FileOutputFormat.setOutputPath(job, new Path(outputPath));

			job.setMapOutputKeyClass(TextPair.class);
			job.setMapOutputValueClass(IntWritable.class);
			job.setOutputKeyClass(TextPair.class);
			job.setOutputValueClass(IntWritable.class);

			job.setMapperClass(AggregatorByLocationMapper.class);
			job.setReducerClass(AggregatorByCategoryReducer.class);
			job.waitForCompletion(true);
		} catch (Exception e) {
			System.out.println("Error running MapReduce Job" + e.getMessage());
		}

	}
}


