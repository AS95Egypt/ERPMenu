program CMASMenuUI;

uses
  Vcl.Forms,
  CMConsts in 'M:\Common Sources D10.4\CMConsts.pas' {CMDockingAForm},
  CMLauncherIFrm in 'CMLauncherIFrm.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  CMDatesTimesIFrm in 'CMDatesTimesIFrm.pas' {CMDatesTimesIForm},
  CMStylesLookupIFrm in 'CMStylesLookupIFrm.pas' {StylesSerialsLookupIForm};
  //CMDatabasesIFrm in 'CMDatabasesIFrm.pas' {DatabasesLookupIForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //TStyleManager.TrySetStyle('Aqua Light Slate');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
