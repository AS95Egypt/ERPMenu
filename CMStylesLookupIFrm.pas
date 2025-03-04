unit CMStylesLookupIFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, siComp, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, DBAccess, MSAccess,
  RzButton, cxButtons, ExtCtrls, RzPanel,

  cxNavigator, dxDateRanges, Vcl.Menus,
  Vcl.StdCtrls, MemDS, VirtualTable;

const
  CThemesArr: array[0..35] of string = (
    'Windows',
    'Lavender Classico',
    'Sky',
    'Slate Classico',
    'Tablet Dark',
    'Tablet Light',
    'Windows10',
    'Windows10 Blue',
    'Windows10 Dark',
    'Windows10 Green',
    'Windows10 Purple',
    'Windows10 SlateGray',
    'Amakrits',
    'Amethyst Kamri',
    'Aqua Graphite',
    'Auric',
    'Carbon',
    'Charcoal Dark Slate',
    'Cabalt XEMedia',
    'Cyan Dusk',
    'Cyan Night',
    'Emerald Light Slate',
    'Golden Graphite',
    'Light',
    'Luna',
    'Metropolis UI Black',
    'Metropolis UI Blue',
    'Metropolis UI Dark',
    'Metropolis UI Green',
    'Obsidian',
    'Onyx Blue',
    'Ruby Graphite',
    'Sapphire Kamri',
    'Silver',
    'Smokey Quartz Kamri',
    'Turquoise Gray');

type
  TStylesSerialsLookupIForm = class(TForm)
    StylescxGridDBTableView: TcxGridDBTableView;
    StylescxGridLevel1: TcxGridLevel;
    StylescxGrid: TcxGrid;
    StylecxGridDBTableViewColumn: TcxGridDBColumn;
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



constructor TStylesSerialsLookupIForm.Create(AOwner: TComponent;
  AsSelectedTheme: String);
begin
  VsSelectedTheme := AsSelectedTheme;
  Inherited Create(AOwner);
end;


procedure TStylesSerialsLookupIForm.FormCreate(Sender: TObject);
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

procedure TStylesSerialsLookupIForm.StylescxGridDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;

  ModalResult := mrOk;
end;

end.
