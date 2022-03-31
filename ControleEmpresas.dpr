program ControleEmpresas;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uFrmCadEmpresas in 'uFrmCadEmpresas.pas' {frmCadEmpresas},
  uFrmPesquisaEmpresa in 'uFrmPesquisaEmpresa.pas' {frmPesquisaEmpresa},
  uFrmCadTitulares in 'uFrmCadTitulares.pas' {frmCadTitulares},
  uFrmCadFuncionarios in 'uFrmCadFuncionarios.pas' {frmCadFuncionarios},
  uFrmPesquisaCidade in 'uFrmPesquisaCidade.pas' {frmPesquisaCidade},
  uFrmCadLocalidades in 'uFrmCadLocalidades.pas' {frmCadLocalidades},
  uFrmPesquisaEstado in 'uFrmPesquisaEstado.pas' {frmPesquisaEstado},
  uFrmCadCidades in 'uFrmCadCidades.pas' {frmCadCidades},
  uFrmCadEnderecos in 'uFrmCadEnderecos.pas' {frmCadEnderecos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadCidades, frmCadCidades);
  Application.CreateForm(TfrmCadEnderecos, frmCadEnderecos);
  Application.Run;
end.
