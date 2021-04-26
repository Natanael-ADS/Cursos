program demo_climba;

uses
  {$IFDEF EurekaLog}
  EMemLeaks,
  EResLeaks,
  EDebugExports,
  EDebugJCL,
  EFixSafeCallException,
  EMapWin32,
  EAppVCL,
  EDialogWinAPIMSClassic,
  EDialogWinAPIEurekaLogDetailed,
  EDialogWinAPIStepsToReproduce,
  ExceptionLog7,
  {$ENDIF EurekaLog}
  Vcl.Forms,
  VMain in 'View\VMain.pas' {Form1},
  MConexaoClimba in 'Model\internet\MConexaoClimba.pas',
  MMarcaClimba in 'Model\stubs\MMarcaClimba.pas',
  MConexaoMarcaClimba in 'Model\internet\MConexaoMarcaClimba.pas',
  MConexaoDepartamentoClimba in 'Model\internet\MConexaoDepartamentoClimba.pas',
  MDepartamentoClimba in 'Model\stubs\MDepartamentoClimba.pas',
  CMarcaClimba in 'Controller\CMarcaClimba.pas',
  CDepartamentoClimba in 'Controller\CDepartamentoClimba.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.





