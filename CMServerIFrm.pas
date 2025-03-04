unit CMDatabasesIFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, siComp, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, DBAccess, MSAccess,
  RzButton, cxButtons, ExtCtrls, RzPanel,

  cxNavigator, dxDateRanges, Vcl.Menus,
  Vcl.StdCtrls, MemDS, VirtualTable, cxContainer, cxCustomListBox, cxListBox;

type
  TDatabasesLookupIForm = class(TForm)
    StylesMSDataSource: TMSDataSource;
    ButtonsRzGroupBox: TRzPanel;
    OKRzBitBtn: TcxButton;
    CancelRzBitBtn: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    EvenRowStyle: TcxStyle;
    OddRowStyle: TcxStyle;
    StylesVirtualTable: TVirtualTable;
    StylesVirtualTableStyleTitle: TStringField;
    siLang: TsiLang;
    DatabasescxListBox: TcxListBox;
    DataBasesMSQuery: TMSQuery;
    DataBasesMSQueryName: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure StylescxGridDBTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    VsSelectedTheme: string;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; AsSelectedTheme: String);
  end;

implementation

{$R *.dfm}

uses CMLocalizationUtils, CMSystemAPI;

constructor TDatabasesLookupIForm.Create(AOwner: TComponent;
  AsSelectedTheme: String);
begin
  VsSelectedTheme := AsSelectedTheme;
  Inherited Create(AOwner);
end;


procedure TDatabasesLookupIForm.FormCreate(Sender: TObject);
var
  LiI, AiRecIndex: Integer;
  LoColumns: array of TcxGridDBColumn;
begin
  inherited;

  siLang.LangDispatcher := LocalizationEngine.siLangDispatcher;

  StylesVirtualTable.Open;
  for LiI := 0 to Length(CThemesArr)-1 do
  begin
    StylesVirtualTable.Append;
    StylesVirtualTableStyleTitle.AsString := CThemesArr[LiI];
    StylesVirtualTable.Post;
  end;

  SetLength(LoColumns,1);

  LoColumns[0] := StylecxGridDBTableViewColumn;
  StylesMSDataSource.DataSet := StylesVirtualTable;

  AiRecIndex := 0;
  AiRecIndex := cmFindGridRecordIndexByText(StylescxGridDBTableView.DataController, LoColumns, AiRecIndex, VsSelectedTheme, True, False, True);
  StylescxGridDBTableView.DataController.FocusedRecordIndex := AiRecIndex;

  Constraints.MinHeight := Height;
  Constraints.MinWidth := Width;
  Constraints.MaxHeight := Height;
  Constraints.MaxWidth := Width;
end;

procedure TDatabasesLookupIForm.StylescxGridDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  ModalResult := mrOk;
end;

end.
