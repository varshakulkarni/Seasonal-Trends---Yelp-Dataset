package sentimentAnalysis.edu.utd;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AggregatorByLocationMapper extends
Mapper<LongWritable, Text, TextPair, IntWritable> {

		private final TextPair pair = new TextPair();
		private final IntWritable one = new IntWritable(1);

		@Override
		public void map(LongWritable key, Text line, Context context) throws IOException,
				InterruptedException {
			String text = line.toString();
			String[] terms = text.split(",");
			pair.set(terms[1], terms[3]);
			context.write(pair, one);
				}
	}



