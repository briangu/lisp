
import org.antlr.runtime.*;
 
public class Test {
    public static void main(String[] args) throws Exception {
        ANTLRInputStream input = new ANTLRInputStream(System.in);
        SexprLexer lexer = new SexprLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        SexprParser parser = new SexprParser(tokens);
        //parser.sexpr();
        System.out.println(parser.sexpr());
    }
}
