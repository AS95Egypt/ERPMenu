unit CMDatesTimesIFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  RzLabel, cxGraphics, cxLookAndFeels, RzButton, siComp, Vcl.ComCtrls, dxCore,
  cxDateUtils;

type
  TCMDatesTimesIForm = class(TForm)
    DatecxDateEdit: TcxDateEdit;
    Label1: TLabel;
    OKRzBitBtn: TcxButton;
    CancelRzBitBtn: TcxButton;
    siLang: TsiLang;
    procedure OKRzBitBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  CMExceptionUtils,  DateUtils, CMSystemAPI, CMLocalizationUtils;
{$R *.dfm}



procedure TCMDatesTimesIForm.FormCreate(Sender: TObject);
begin
  inherited;

  siLang.LangDispatcher := LocalizationEngine.siLangDispatcher;
//  case VenuDisplayMode of
//    dmLinkToGL:    Caption := siLang.GetTextOrDefault('IDS_FormCaption_LinkToGL');
//    dmCopyTransaction: Caption := siLang.GetTextOrDefault('IDS_FormCaption_CopyTransaction');
//  end;

  DatecxDateEdit.Date := Dateof(Now);
end;

procedure TCMDatesTimesIForm.OKRzBitBtnClick(Sender: TObject);
begin
  if VarIsUndefined(DatecxDateEdit.EditingValue) then
  begin
    ModalResult := mrNone;
    raise CMException.Create('SCMessagesEngine.RSCInterfaceMsg.NoDateSelected'{SCMessagesEngine.RSCInterfaceMsg.NoDateSelected});
  end; // if
end;

end.
