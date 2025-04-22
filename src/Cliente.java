
public abstract class Cliente {
    protected String nome;
    protected String telefone;
    protected String email;

    public Cliente(String nome, String telefone, String email) {
        this.nome = nome;
        this.telefone = telefone;
        this.email = email;
    }
    public abstract String getDocumento();
}
public class ClienteNacional extends Cliente {
    private String cpf;

    public ClienteNacional(String nome, String telefone, String email, String cpf) {
        super(nome, telefone, email);
        this.cpf = cpf;
    }
}
    @Override
    public String getDocumento() {
        return cpf;
    }
    public class ClienteEstrangeiro extends Cliente {
        private String passaporte;
    
        public ClienteEstrangeiro(String nome, String telefone, String email, String passaporte) {
            super(nome, telefone, email);
            this.passaporte = passaporte;
        }
    
        @Override
        public String getDocumento() {
            return passaporte;
        }
    }