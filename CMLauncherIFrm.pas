unit CMLauncherIFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, Vcl.StdCtrls, cxTextEdit, Vcl.ExtCtrls, cxContainer,
  cxEdit, Vcl.Mask, System.ImageList, Vcl.ImgList, cxImageList, RzButton,
  RzEdit, RzBtnEdt, ElXPThemedControl, ElEdits, ElBtnEdit, RzPanel, RzPathBar,

  System.Generics.Collections, cxImageComboBox, Vcl.Menus, cxClasses, RzCommon,
  dxLayoutContainer, dxLayoutControl, dxGDIPlusClasses, RzBckgnd, CMConsts,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges,
  cxDBLookupComboBox, Data.DB, cxDBData, cxGridLevel, cxGridDBTableView,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridCustomView, cxGrid, VCL.Themes, RzBmpBtn, Vcl.Buttons, siComp,
  CMDatesTimesIFrm, CMLocalizationUtils, CMStylesLookupIFrm, System.IniFiles,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar,
  CMEditors, dxStatusBar, dxRibbonStatusBar, MemDS, DBAccess, MSAccess;

type
  TNodeType = (ntMain, ntSub);

  TForm1 = class(TForm)
    cxTreeList1: TcxTreeList;
    NameARcxTreeList1Column: TcxTreeListColumn;
    Panel1: TPanel;
    RzToolButtonPrevious: TRzToolButton;
    Btns24ImageList: TcxImageList;
    RzToolButtonForward: TRzToolButton;
    SidePanel: TPanel;
    ButtonsPanel: TPanel;
    DeptRzToolButton: TRzToolButton;
    HomeRzToolButton: TRzToolButton;
    RzPathBar1: TRzPathBar;
    TreeBtns24ImageList: TcxImageList;
    PanelPath: TPanel;
    Menu32ImageList: TcxImageList;
    ImagecxTreeList1Column: TcxTreeListColumn;
    Menu16ImageList: TcxImageList;
    RzToolButtonHistory: TRzToolButton;
    Menu24ImageList: TcxImageList;
    NameENcxTreeList1Column: TcxTreeListColumn;
    IsFavcxTreeList1Column: TcxTreeListColumn;
    NavBarIndexcxTreeList1Column: TcxTreeListColumn;
    ModuleIdcxTreeList1Column: TcxTreeListColumn;
    IsReportcxTreeList1Column: TcxTreeListColumn;
    Panel3: TPanel;
    ScrollBox1: TScrollBox;
    SubNodeModuleIDcxTreeList1Column: TcxTreeListColumn;
    HistoryPopupMenu: TPopupMenu;
    SC24cxImageList: TcxImageList;
    MV24cxImageList: TcxImageList;
    PR24cxImageList: TcxImageList;
    SL24cxImageList: TcxImageList;
    CIM24cxImageList: TcxImageList;
    GL24cxImageList: TcxImageList;
    FA24cxImageList: TcxImageList;
    LC24cxImageList: TcxImageList;
    FC24cxImageList: TcxImageList;
    PL24cxImageList: TcxImageList;
    TC24cxImageList: TcxImageList;
    ResultScrollBox: TScrollBox;
    SettingsRzMenuToolbarButton: TRzMenuToolbarButton;
    UtilsPopupMenu: TPopupMenu;
    mWorkDate: TMenuItem;
    mSelectLanguage: TMenuItem;
    N1: TMenuItem;
    mSelectStyle: TMenuItem;
    mSelectServerName: TMenuItem;
    mSelectDatabase: TMenuItem;
    N2: TMenuItem;
    mExit: TMenuItem;
    MenucxImageList: TcxImageList;
    siLang: TsiLang;
    mArabic: TMenuItem;
    mEnglish: TMenuItem;
    RzToolButtonHomePath: TRzToolButton;
    PathPanel: TPanel;
    RzToolButtonRefresh: TRzToolButton;
    cxTextEditPath: TcxTextEdit;
    PanelSearch: TPanel;
    RzToolButtonSearch: TRzToolButton;
    cxTextEditSearch: TcxTextEdit;
    dxRibbonStatusBar: TdxRibbonStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure SaveTreeButtonClick(Sender: TObject);
    procedure cxTreeList1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure cxTreeList1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxTreeList1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SidePanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SidePanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SidePanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxTreeList1CustomDrawIndentCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListIndentCellViewInfo;
      var ADone: Boolean);
    procedure cxTreeList1MouseLeave(Sender: TObject);
    procedure LoadTreeButtonClick(Sender: TObject);
    procedure cxTreeList1FocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure cxTreeList1CustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure RzToolButtonForwardClick(Sender: TObject);
    procedure RzToolButtonPreviousClick(Sender: TObject);
    procedure RzToolButtonHistoryClick(Sender: TObject);
    procedure LinkLabel1LinkClick(Sender: TObject; const Link: string;
      LinkType: TSysLinkType);
    procedure LinkLabel1Click(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure cxTextEditSearchPropertiesChange(Sender: TObject);
    procedure mWorkDateClick(Sender: TObject);
    procedure mExitClick(Sender: TObject);
    procedure mEnglishClick(Sender: TObject);
    procedure mArabicClick(Sender: TObject);
    procedure SettingsRzMenuToolbarButtonClick(Sender: TObject);
    procedure mSelectStyleClick(Sender: TObject);
    procedure RzToolButtonHomePathClick(Sender: TObject);
    procedure cxTextEditPathEnter(Sender: TObject);
    procedure cxTextEditSearchEnter(Sender: TObject);
    procedure cxTextEditSearchExit(Sender: TObject);
    procedure cxTextEditPathKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTextEditPathExit(Sender: TObject);
  private
    { Private declarations }
    VbIsResizing, VbNavigate: boolean;
    VoOldPos : TPoint;

    VoHistoryList: TList<Integer>;
    ViListIndex: Integer;

    VocxImageList: TcxImageList;
    VbIsArabic: boolean;


    procedure FillTree;
    procedure FillTreeImageComboBox;
    procedure AdjustNavBtns;

    procedure DoClickPathBarItem(Sender: TObject);
    procedure MeasureMenuItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
    procedure AdvancedDrawMenuItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
    procedure DoItemClick(Sender: TObject);
    procedure DoLabelClick(Sender: TObject);
    procedure DoDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
    procedure DoLinkLabel1LinkClick(Sender: TObject; const Link: string; LinkType: TSysLinkType);

    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);

    procedure PanelMouseEnter(Sender: TObject);
    procedure PanelMouseLeave(Sender: TObject);

    procedure setActiveImageList(AoModule: TSystemModules);
    function GetAppTheme: string;
    procedure SetAppTheme(VsAppTheme: string);

    // IIF
    function IIF(AbExpression: boolean; AvTrue, AvFalse: Variant): Variant;

const
    CY: Integer = 25;
    CH25: Integer = 25;

    CImageW: Integer = 20;
    CImageH: Integer = 20;

    CSpace5: Integer = 5;
    CSpace10: Integer = 10;
    CSpace15: Integer = 15;

    CSperatorH : Integer = 1;
    CSearchW450: Integer = 450;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

procedure TForm1.SaveTreeButtonClick(Sender: TObject);
begin
  cxTreeList1.SaveToFile('treeitems.txt');
end;

procedure TForm1.ScrollBox1Click(Sender: TObject);
begin
  ScrollBox1.SetFocus;
end;

procedure TForm1.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  LTopLeft, LTopRight, LBottomLeft, LBottomRight: SmallInt;
  LPoint: TPoint;
  ScrollBox: TScrollBox;
begin
  ScrollBox := TScrollBox(Sender);
  LPoint := ScrollBox.ClientToScreen(Point(0,0));
  LTopLeft := LPoint.X;
  LTopRight := LTopLeft + ScrollBox.ClientWidth;
  LBottomLeft := LPoint.Y;
  LBottomRight := LBottomLeft + ScrollBox.ClientWidth;
  if (MousePos.X >= LTopLeft) and
    (MousePos.X <= LTopRight) and
    (MousePos.Y >= LBottomLeft) and
    (MousePos.Y <= LBottomRight) then
  begin
    ScrollBox.VertScrollBar.Position := ScrollBox.VertScrollBar.Position - WheelDelta;
    Handled := True;
  end;
end;

procedure TForm1.setActiveImageList(AoModule: TSystemModules);
begin
   case AoModule of
     smGL: VocxImageList := GL24cxImageList;
     //smPF: ;
     smCIM: VocxImageList := CIM24cxImageList;
     smMV: VocxImageList := MV24cxImageList;
     smSC: VocxImageList := SC24cxImageList;
     smPR: VocxImageList := PR24cxImageList;
     smSL: VocxImageList := SL24cxImageList;
     smFA: VocxImageList := FA24cxImageList;
     smLC: VocxImageList := LC24cxImageList;
     smFC: VocxImageList := FC24cxImageList;
     smTC: VocxImageList := TC24cxImageList;
     smPL: VocxImageList := PL24cxImageList;
     else
       VocxImageList := Btns24ImageList;
   end;
end;

procedure TForm1.AdjustNavBtns;
begin
  RzToolButtonForward.Enabled := (ViListIndex < VoHistoryList.Count-1);
  RzToolButtonPrevious.Enabled := (ViListIndex > 0);
end;

procedure TForm1.cxTextEditPathEnter(Sender: TObject);
begin
  cxTextEditPath.SelectAll;
  PanelPath.Visible := false;
end;

procedure TForm1.cxTextEditPathExit(Sender: TObject);
begin
  PanelPath.Visible := True;
end;

procedure TForm1.cxTextEditPathKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  LoCurrentNode: TcxTreeListNode;
  LsSelectedPath: string;
  LArrPathItems: TArray<string>;
  LiI: Integer;
begin
  if (Key = VK_RETURN) then
  begin
   try
     LoCurrentNode := cxTreeList1.Root;
     LsSelectedPath := cxTextEditPath.Text;

     if LsSelectedPath = EmptyStr then
        raise Exception.Create('Empty Path URL');

     LArrPathItems := LsSelectedPath.Split(['\']);
     for LiI := 0 to Length(LArrPathItems)-1 do
       LoCurrentNode := cxTreeList1.FindNodeByText(LArrPathItems[LiI], NameARcxTreeList1Column, LoCurrentNode);

     if LoCurrentNode <> nil then
       cxTreeList1.AbsoluteItems[LoCurrentNode.AbsoluteIndex].Selected := True;
     cxTreeList1.SetFocus;
   except on E: Exception do
     raise Exception.Create('Invalid Path URL');
   end; // try..except
  end; // if
end;

procedure TForm1.cxTreeList1CustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var
  LiImageIndex, LiModuleId: Integer;
  LsCaption: string;
begin
  // Deparments
  if (AViewInfo.Node.Level = 0) then
  begin
    if AViewInfo.Node.Focused then
      ACanvas.Font.Color := clBlack
    else
      ACanvas.Font.Color := clMenuHighLight;
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Size := 11;
  end
  // Modules
  else if (AViewInfo.Node.Level = 1) then
  begin
    if AViewInfo.Node.Focused then
      ACanvas.Font.Color := clBlack
    else
      ACanvas.Font.Color := clMenuHighLight;
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Size := 9;
  end
  // Forms
  else
  begin
    ACanvas.Font.Color := clBlack;
    ACanvas.Font.Size := 9;
  end;//if

  with AViewInfo do
   with Node, ACanvas do
   begin
      // draw Image
      Pen.Color := Brush.Color;

      Canvas.Rectangle(BoundsRect.Left, BoundsRect.Top, BoundsRect.Right, BoundsRect.Bottom+1);

      if VarIsNull(Node.Values[ImagecxTreeList1Column.ItemIndex]) then
         LiImageIndex := 0
      else
         LiImageIndex := Node.Values[ImagecxTreeList1Column.ItemIndex];

     //  draw text
      LsCaption := Node.Values[NameARcxTreeList1Column.ItemIndex];
      if not VbIsArabic then
        TextOut((50+(Node.Level*15)), BoundsRect.Top + ((BoundsRect.Bottom - BoundsRect.Top) - TextHeight(LsCaption)) div 2, LsCaption)
      else
        TextOut(BoundsRect.Right - TextWidth(LsCaption) - (CSpace5 + CImageW), BoundsRect.Top + ((BoundsRect.Bottom - BoundsRect.Top) - TextHeight(LsCaption)) div 2, LsCaption);

      with BoundsRect do
      begin
        if Node.Level = 0 then
        begin
          if VbIsArabic then
            Menu24ImageList.Draw(Canvas, BoundsRect.Right - (CImageW+CSpace5), (Top + (Bottom - Top) div 2) - 12, 14, dsTransparent, itImage)
          else
            Menu24ImageList.Draw(Canvas, Left, (Top + (Bottom - Top) div 2) - 12, 14, dsTransparent, itImage)
        end
        else if Node.Level = 1 then
        begin
          if VbIsArabic then
            Menu24ImageList.Draw(Canvas, BoundsRect.Right - (CImageW+CSpace5), (Top + (Bottom - Top) div 2) - 12, LiImageIndex, dsTransparent, itImage)
          else
            Menu24ImageList.Draw(Canvas, Left, (Top + (Bottom - Top) div 2) - 12, LiImageIndex, dsTransparent, itImage)
        end
        else if Node.Level > 1 then
        begin
          if VarIsNull(Node.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex]) then
             LiModuleId := 0
          else
             LiModuleId := Node.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex];

          if Not VbIsArabic then
            VocxImageList.Draw(Canvas, Left , (Top + (Bottom - Top) div 2) - 12, LiImageIndex, dsTransparent, itImage)
          else
            VocxImageList.Draw(Canvas, BoundsRect.Right - (CImageW+CSpace5), (Top + (Bottom - Top) div 2) - 12, LiImageIndex, dsTransparent, itImage)
        end;//if.
      end;//if.
      ADone := True;
   end;//with.
end;


procedure TForm1.cxTreeList1CustomDrawIndentCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListIndentCellViewInfo;
  var ADone: Boolean);
var
  LiWidth: integer;
begin
  with AViewInfo do
    with Node, ACanvas do
        if HasChildren then
        begin
          //Pen.Color := Brush.Color;

          Canvas.Rectangle(BoundsRect.Left, BoundsRect.Top, BoundsRect.Right, BoundsRect.Bottom+1);


          with BoundsRect do
          begin
//            if Expanded then
//              TreeBtns24ImageList.Draw(Canvas, (Left + (Right-Left) div 2) - 8, (Top + (Bottom - Top) div 2) - 8, 0, dsTransparent, itImage)
//            else
//              TreeBtns24ImageList.Draw(Canvas, (Left + (Right-Left) div 2) - 8, (Top + (Bottom - Top) div 2) - 8, 1, dsTransparent, itImage);
          end;

          ADone := True;
        end;//if.
end;

procedure TForm1.cxTreeList1FocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var
  LsSelectedPath: string;
  LoCurrentNode, LoMainNode, LoSubNode: TcxTreeListNode;
  LArrNodes: array of TcxTreeListNode;
  LiI, LiJ: Integer;
  LoMenuItem: TMenuItem;

  LoLbl: TLabel;
  LoImage: TImage;
  LoRzSeparator: TRzSeparator;
  LiImageIndex, LiModuleId: Integer;
  LbIsNodeChildLeafs: boolean;

  LiImageLeft, LiLabelLeft, LiSeparatorLeft: integer;

  LiCol1_Y, LiCol2_Y, LiCol3_Y: Integer;
  LiCol1_X, LiCol2_X, LiCol3_X: Integer;


  procedure FillHistoryMenuItems;
  var
    LiJ: Integer;
  begin
    HistoryPopupMenu.Items.Clear;

    for LiJ := 0 to VoHistoryList.Count-1 do
    begin
      LoMenuItem := TMenuItem.Create(nil);
      with LoMenuItem do
      begin
        Caption := cxTreeList1.AbsoluteItems[VoHistoryList[LiJ]].Values[NameARcxTreeList1Column.ItemIndex];
        Tag := VoHistoryList[LiJ];
        if VarIsNull(cxTreeList1.AbsoluteItems[VoHistoryList[LiJ]].Values[ImagecxTreeList1Column.ItemIndex]) then
          ImageIndex := -1
        else
          ImageIndex := cxTreeList1.AbsoluteItems[VoHistoryList[LiJ]].Values[ImagecxTreeList1Column.ItemIndex];
        LoMenuItem.Name := Format('N%S',[VoHistoryList[LiJ].ToString]);
        LoMenuItem.OnClick := DoItemClick;
        //LoMenuItem.OnAdvancedDrawItem := AdvancedDrawMenuItem;
        HistoryPopupMenu.Items.Add(LoMenuItem);
      end; // with
    end; // for
  end;

  function IsNodeChildLeafs(AoNode: TcxTreeListNode): boolean;
  var
    LiI: Integer;
  begin
    Result := true;
    for LiI := 0 to AoNode.Count -1 do
      if AoNode.Items[LiI].HasChildren then
        Exit(false);
  end;

  procedure AddMainNodeCaption(AoNode: TcxTreeListNode; AiCurrentIndex: Integer);
  begin
      // Main
      LoLbl := TLabel.Create(ScrollBox1);
      with LoLbl do
      begin
        Caption := AoNode.Values[NameARcxTreeList1Column.ItemIndex];
        Parent := ScrollBox1;
        Tag := AoNode.AbsoluteIndex;
        Font.Style := [fsBold];
        Font.Color := clHighlight;
        OnMouseEnter := LabelMouseEnter;
        OnMouseLeave := LabelMouseLeave;
        OnClick := DoLabelClick;
      end;

      if VarIsNull(AoNode.Values[ImagecxTreeList1Column.ItemIndex]) then
         LiImageIndex := -1
      else
         LiImageIndex := AoNode.Values[ImagecxTreeList1Column.ItemIndex];

      if VarIsNull(AoNode.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex]) then
         LiModuleId := 0
      else
         LiModuleId := AoNode.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex];

      LoImage := TImage.Create(ScrollBox1);
      with LoImage do
      begin
        Width := CImageW;
        Height := CImageH;
        Stretch := True;
        Parent := ScrollBox1;

        Stretch := true;
        Proportional := true;
        Picture.Bitmap:= nil;
        VocxImageList.GetBitmap(LiImageIndex, LoImage.Picture.Bitmap);
      end;

      case (AiCurrentIndex + 1) mod 3 of
        1:  // Column 1
          begin
            if VbIsArabic then
            begin
              LiImageLeft := LiCol1_X + Trunc(ScrollBox1.Width*0.25);
              LiLabelLeft := LiCol1_X + (Trunc(ScrollBox1.Width*0.25) - LoLbl.Width);
            end
            else
            begin
              LiImageLeft := LiCol1_X + CSpace10;
              LiLabelLeft := LiCol1_X + CImageW + CSpace15;
            end;

            // Image
            with LoImage do
              LoImage.SetBounds(LiImageLeft, LiCol1_Y, Width, Height);
            // Label
            with LoLbl do
              LoLbl.SetBounds(LiLabelLeft, LiCol1_Y, Width, Height);
            Inc(LiCol1_Y, CY);
          end;
        2:  // Column 2
          begin
            if VbIsArabic then
            begin
              LiImageLeft := LiCol2_X + Trunc(ScrollBox1.Width*0.25);
              LiLabelLeft := LiCol2_X + (Trunc(ScrollBox1.Width*0.25) - LoLbl.Width);
            end
            else
            begin
              LiImageLeft := LiCol2_X + CSpace10;
              LiLabelLeft := LiCol2_X+ 55;
            end;

            // Image
            with LoImage do
              LoImage.SetBounds(LiImageLeft, LiCol2_Y, Width, Height);
            // Label
            with LoLbl do
              LoLbl.SetBounds(LiLabelLeft, LiCol2_Y, Width, Height);
            Inc(LiCol2_Y, CY);
          end;
        0:  // Column 3
          begin
            if VbIsArabic then
            begin
              LiImageLeft := LiCol3_X + Trunc(ScrollBox1.Width*0.25);
              LiLabelLeft := LiCol3_X + (Trunc(ScrollBox1.Width*0.25) - LoLbl.Width);
            end
            else
            begin
              LiImageLeft := LiCol3_X + CSpace10;
              LiLabelLeft := LiCol3_X + CImageW + CSpace15;
            end;

            // Image
            with LoImage do
              LoImage.SetBounds(LiImageLeft, LiCol3_Y, Width, Height);
            // Label
            with LoLbl do
              LoLbl.SetBounds(LiLabelLeft, LiCol3_Y, Width, Height);
            Inc(LiCol3_Y, CY);
          end;
      end; // case.
  end;

  procedure AddSubNodeCaption(AoNode: TcxTreeListNode; AiCurrentIndex: Integer);
  begin
    LoLbl := TLabel.Create(ScrollBox1);
    with LoLbl do
    begin
      Caption := AoNode.Values[NameARcxTreeList1Column.ItemIndex];
      Parent := ScrollBox1;
      Tag := AoNode.AbsoluteIndex;
      OnMouseEnter := LabelMouseEnter;
      OnMouseLeave := LabelMouseLeave;
      OnClick := DoLabelClick;
    end;

    if VarIsNull(AoNode.Values[ImagecxTreeList1Column.ItemIndex]) then
       LiImageIndex := -1
    else
       LiImageIndex := AoNode.Values[ImagecxTreeList1Column.ItemIndex];

    if VarIsNull(AoNode.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex]) then
       LiModuleId := 0
    else
       LiModuleId := AoNode.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex];

    LoImage := TImage.Create(ScrollBox1);
    with LoImage do
    begin
      Width := CImageW;
      Height := CImageH;
      Stretch := True;
      Parent := ScrollBox1;

      Stretch := true;
      Proportional := true;
      Picture.Bitmap:= nil;
      VocxImageList.GetBitmap(LiImageIndex, LoImage.Picture.Bitmap);
    end;

    case (AiCurrentIndex + 1) mod 3 of
      1:  // Column 1
        begin
          if VbIsArabic then
          begin
            LiImageLeft := (LiCol1_X + Trunc(ScrollBox1.Width*0.25)) - (CImageW);
            LiLabelLeft := (LiCol1_X + (Trunc(ScrollBox1.Width*0.25) - LoLbl.Width)) - (CSpace5 + CImageW);
          end
          else
          begin
            LiImageLeft := LiCol1_X + CImageW + CSpace10;
            LiLabelLeft := LiCol1_X+ 55;
          end;
          // Image
          with LoImage do
            LoImage.SetBounds(LiImageLeft, LiCol1_Y, Width, Height);
          // Label
          with LoLbl do
            LoLbl.SetBounds(LiLabelLeft, LiCol1_Y, Width, Height);

          Inc(LiCol1_Y, CY);
        end;
      2:  // Column 2
        begin
          if VbIsArabic then
          begin
            LiImageLeft := (LiCol2_X + Trunc(ScrollBox1.Width*0.25)) - CImageW;
            LiLabelLeft := LiCol2_X + (Trunc(ScrollBox1.Width*0.25) - LoLbl.Width) - (CSpace5 + CImageW);
          end
          else
          begin
            LiImageLeft := LiCol2_X + CImageW + CSpace10;
            LiLabelLeft := LiCol2_X+ 55;
          end;
          // Image
          with LoImage do
            LoImage.SetBounds(LiImageLeft, LiCol2_Y, Width, Height);
          // Label
          with LoLbl do
            LoLbl.SetBounds(LiLabelLeft, LiCol2_Y, Width, Height);

          Inc(LiCol2_Y, CY);
        end;
      0:  // Column 3
        begin
          if VbIsArabic then
          begin
            LiImageLeft := LiCol3_X + Trunc(ScrollBox1.Width*0.25) - CImageW;
            LiLabelLeft := (LiCol3_X + (Trunc(ScrollBox1.Width*0.25) - LoLbl.Width)) - (CSpace5 + CImageW);
          end
          else
          begin
            LiImageLeft := LiCol3_X + CImageW + CSpace10;
            LiLabelLeft := LiCol3_X+ 55;
          end;
          // Image
          with LoImage do
            LoImage.SetBounds(LiImageLeft, LiCol3_Y, Width, Height);
          // Label
          with LoLbl do
            LoLbl.SetBounds(LiLabelLeft, LiCol3_Y, Width, Height);

          Inc(LiCol3_Y, CY);
        end;
    end; // case.
  end;


  procedure AddSeparator(AiColIndex: Integer);
  begin
    LoRzSeparator := TRzSeparator.Create(ScrollBox1);
    case (AiColIndex + 1) mod 3 of
      1:  // Column 1
        begin
          if VbIsArabic then
            LiSeparatorLeft := LiCol1_X + (Trunc(ScrollBox1.Width*0.25) - LoRzSeparator.Width)
          else
            LiSeparatorLeft := LiCol1_X + CSpace10;

          Inc(LiCol1_Y, CSpace10);
          LoRzSeparator.SetBounds(LiSeparatorLeft, LiCol1_Y, 200, CSperatorH);
          Inc(LiCol1_Y, CY);
        end;
      2:  // Column 2
        begin
          if VbIsArabic then
            LiSeparatorLeft := LiCol2_X + (Trunc(ScrollBox1.Width*0.25) - LoRzSeparator.Width)
          else
            LiSeparatorLeft := LiCol2_X + CSpace10;

          Inc(LiCol2_Y, CSpace10);
          LoRzSeparator.SetBounds(LiSeparatorLeft, LiCol2_Y, 200, CSperatorH);
          Inc(LiCol2_Y, CY);
        end;
      0:  // Column 3
        begin
          if VbIsArabic then
            LiSeparatorLeft := LiCol3_X + (Trunc(ScrollBox1.Width*0.25) - LoRzSeparator.Width)
          else
            LiSeparatorLeft := LiCol3_X + CSpace10;
          Inc(LiCol3_Y, CSpace10);
          LoRzSeparator.SetBounds(LiSeparatorLeft, LiCol3_Y, 200, CSperatorH);
          Inc(LiCol3_Y, CY);
        end; // case.
    end;
    LoRzSeparator.ShowGradient := false;
    LoRzSeparator.Height := CSperatorH;
    LoRzSeparator.Parent := ScrollBox1;
    LoRzSeparator.HighlightColor := clGrayText;
  end;

begin
  LsSelectedPath := EmptyStr;
  LiI := 0;
  RzPathBar1.Items.Clear;
  SetLength(LArrNodes,1);

  try
    LoCurrentNode := AFocusedNode;

    if not VbNavigate then
    begin
      VoHistoryList.Add(LoCurrentNode.AbsoluteIndex);
      if VoHistoryList.Count > 10 then
        VoHistoryList.Remove(VoHistoryList[0])
      else
        Inc(ViListIndex);

      FillHistoryMenuItems;
    end;
    AdjustNavBtns;
    Repeat
    begin
      LArrNodes[LiI] := LoCurrentNode;
      LoCurrentNode := LoCurrentNode.Parent;
      if LoCurrentNode.Parent <> nil then
      begin
        Inc(LiI);
        SetLength(LArrNodes,Length(LArrNodes)+1);
      end; // if
    end // repeat
    Until LoCurrentNode.Parent = nil;


    // Create pathbar items and PathStr
    for LiI := Length(LArrNodes)-1 Downto 0 do
    begin
      if (LiI = (Length(LArrNodes)-1)) then
        LsSelectedPath := LArrNodes[LiI].Values[NameARcxTreeList1Column.ItemIndex]
      else
        LsSelectedPath := LsSelectedPath+'\'+LArrNodes[LiI].Values[NameARcxTreeList1Column.ItemIndex];

      with RzPathBar1.Items.Add do
      begin
        Caption := LArrNodes[LiI].Values[NameARcxTreeList1Column.ItemIndex];
        Tag := LArrNodes[LiI].AbsoluteIndex;
        LinkInfo := LsSelectedPath;
        if VarIsNull(LArrNodes[LiI].Values[ImagecxTreeList1Column.ItemIndex]) then
          ImageIndex := -1
        else
          ImageIndex := LArrNodes[LiI].Values[ImagecxTreeList1Column.ItemIndex];
        OnClick := DoClickPathBarItem;
      end; // with
    end; // for
  finally
    SetLength(LArrNodes,0);
    Finalize(LArrNodes);
  end;//try..finally

  // >>> Fill the Center

  LoCurrentNode := AFocusedNode;
  if LoCurrentNode.Level = 1 then
    setActiveImageList(TSystemModules(LoCurrentNode.Values[ModuleIdcxTreeList1Column.ItemIndex]))
  else if LoCurrentNode.Level > 1 then
    setActiveImageList(TSystemModules(LoCurrentNode.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex]));

  LiCol1_Y := CSpace10;
  LiCol2_Y := CSpace10;
  LiCol3_Y := CSpace10;

  if VbIsArabic then
  begin
    LiCol1_X := Trunc(ScrollBox1.Width*0.7);
    LiCol2_X := Trunc(ScrollBox1.Width*0.4);
    LiCol3_X := Trunc(ScrollBox1.Width*0.1);
  end
  else
  begin
//    LiCol1_X := 0;
//    LiCol2_X := Trunc(ScrollBox1.Width/3);
//    LiCol3_X := Trunc((ScrollBox1.Width/3)*2);

    LiCol1_X := Trunc(ScrollBox1.Width*0.05);
    LiCol2_X := Trunc(ScrollBox1.Width*0.35);
    LiCol3_X := Trunc(ScrollBox1.Width*0.65);
  end;

  while Scrollbox1.ControlCount > 0 do
    Scrollbox1.controls[0].Free;

  if LoCurrentNode.HasChildren then
  begin
    LbIsNodeChildLeafs := IsNodeChildLeafs(LoCurrentNode);

    if LbIsNodeChildLeafs then
    begin
      AddMainNodeCaption(LoCurrentNode, 0);

      if LoCurrentNode.HasChildren then
        for LiI := 0 to LoCurrentNode.Count - 1 do
        begin
          AddSubNodeCaption(LoCurrentNode.Items[LiI], 0);
        end; // for.
    end
    else
      for LiI := 0 to LoCurrentNode.Count - 1 do
      begin
        AddMainNodeCaption(LoCurrentNode.Items[LiI],LiI);

        // Sub
        if LoCurrentNode.Items[LiI].HasChildren then
          for LiJ := 0 to LoCurrentNode.Items[LiI].Count - 1 do
          begin
            AddSubNodeCaption(LoCurrentNode.Items[LiI].Items[LiJ], LiI);
          end; // for.

        // separator
        AddSeparator(LiI);
      end; // for.
  end // for.
  else
  begin
    AddMainNodeCaption(LoCurrentNode, 0);
  end;

  LoCurrentNode.Expand(false);
  cxTextEditPath.Text := LsSelectedPath;
  PanelPath.Width := (Length(LsSelectedPath)+Trunc(1/Length(LsSelectedPath)*Length(LsSelectedPath))) * 11{cxTextEditPath.Font.Size};
end;

procedure TForm1.cxTreeList1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TWinControl) then
  begin
    VbIsResizing := True;
    SetCapture(TWinControl(Sender).Parent.Handle);
    GetCursorPos(VoOldPos);
  end;
end;

procedure TForm1.cxTreeList1MouseLeave(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TForm1.cxTreeList1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  CminWidth = 200;
  CmaxWidth = 400;
var
  LoNewPos: TPoint;
  LoFrmPoint : TPoint;
begin
  if (X < (SidePanel.ClientWidth)) and (X > (SidePanel.ClientWidth-10)) then
    Screen.Cursor := crSizeWE
  else
    Screen.Cursor := crDefault;

  if VbIsResizing then
  begin
    with TWinControl(Sender).Parent do
    begin
      GetCursorPos(LoNewPos);

      Screen.Cursor := crSizeNWSE;
      LoFrmPoint := ScreenToClient(Mouse.CursorPos);
      if (LoFrmPoint.X > CminWidth) and (LoFrmPoint.X < CmaxWidth) then
        Width := LoFrmPoint.X;
    end; // with
  end; // if
end;

procedure TForm1.cxTreeList1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if VbIsResizing then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    VbIsResizing := False;
  end;
end;

procedure TForm1.cxTextEditSearchEnter(Sender: TObject);
begin
  if cxTextEditSearch.Text <> EmptyStr then
    ResultScrollBox.Show;
end;

procedure TForm1.cxTextEditSearchExit(Sender: TObject);
begin
  ResultScrollBox.Hide;
end;

procedure TForm1.cxTextEditSearchPropertiesChange(Sender: TObject);

var
  LiHeight, LiItemsFound, LiImageIndex, LiModuleId, LiCol1_Y: Integer;
  LoPanel: TPanel;
  LoNodeLbl, LoParentLbl: TLabel;
  LoNodeImage, LoParentImage: TImage;
  LoRzSeparator: TRzSeparator;

  procedure AddMainNodeCaption(AoNode: TcxTreeListNode);
  begin
      LoPanel := TPanel.Create(ResultScrollBox);
      with LoPanel do
      begin
        Parent := ResultScrollBox;
        BevelOuter := bvNone;
        SetBounds(0, LiCol1_Y, CSearchW450, CH25);
        Tag := AoNode.AbsoluteIndex;
        ShowCaption := false;
        ParentBackground := false;
        OnMouseEnter := PanelMouseEnter;
        OnMouseLeave := PanelMouseLeave;
        OnClick := DoLabelClick;
        Color := clWhite;
      end;

      // module
      if VarIsNull(AoNode.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex]) then
         LiModuleId := 0
      else
         LiModuleId := AoNode.Values[SubNodeModuleIdcxTreeList1Column.ItemIndex];

      setActiveImageList(TSystemModules(LiModuleId));

      if AoNode.Parent <> nil then
        if VarIsNull(AoNode.Parent.Values[ImagecxTreeList1Column.ItemIndex]) then
           LiImageIndex := -1
        else
           LiImageIndex := AoNode.Parent.Values[ImagecxTreeList1Column.ItemIndex];

      // >>> Parent node
      LoParentImage := TImage.Create(LoPanel);
      with LoParentImage do
      begin
        Width := CImageW;
        Height := CImageH;
        Stretch := True;
        Parent := LoPanel;
        Stretch := true;
        Proportional := true;
        Picture.Bitmap:= nil;
        VocxImageList.GetBitmap(LiImageIndex, LoParentImage.Picture.Bitmap);
      end;

      LoParentLbl := TLabel.Create(LoPanel);
      with LoParentLbl do
      begin
        if AoNode.Parent <> nil then
          Caption := AoNode.Parent.Values[NameARcxTreeList1Column.ItemIndex]
        else
          Caption := EmptyStr;
        Parent := LoPanel;
        Tag := AoNode.AbsoluteIndex;
        OnMouseEnter := LabelMouseEnter;
        OnMouseLeave := LabelMouseLeave;
        OnClick := DoLabelClick;
      end;

      // Image
      with LoParentImage do
        LoParentImage.SetBounds(2, 3, CImageW, CImageH);
      // Label
      with LoParentLbl do
        LoParentLbl.SetBounds(2 + CY, CSpace5, {140}Trunc((CSearchW450/5)*2)-50, CImageH);

      // >>> Vertical separator
      LoRzSeparator := TRzSeparator.Create(LoPanel);
      with LoRzSeparator do
      begin
        Parent := LoPanel;
        ShowGradient := false;
        HighlightColor := clGrayText;
      end;

      // >>> Node
      if VarIsNull(AoNode.Values[ImagecxTreeList1Column.ItemIndex]) then
         LiImageIndex := -1
      else
         LiImageIndex := AoNode.Values[ImagecxTreeList1Column.ItemIndex];

      LoNodeImage := TImage.Create(LoPanel);
      with LoNodeImage do
      begin
        Width := CImageW;
        Height := CImageH;
        Stretch := True;
        Parent := LoPanel;
        Stretch := true;
        Proportional := true;
        Picture.Bitmap:= nil;
        VocxImageList.GetBitmap(LiImageIndex, LoNodeImage.Picture.Bitmap);
      end;

      LoNodeLbl := TLabel.Create(LoPanel);
      with LoNodeLbl do
      begin
        Caption := AoNode.Values[NameARcxTreeList1Column.ItemIndex];
        Parent := LoPanel;
        Tag := AoNode.AbsoluteIndex;
        OnMouseEnter := LabelMouseEnter;
        OnMouseLeave := LabelMouseLeave;
        OnClick := DoLabelClick;
      end;

      // Image
      with LoNodeImage do
        LoNodeImage.SetBounds(Trunc((CSearchW450/5)*2) + CSpace10, 3, CImageW, CImageH);
      // Label
      with LoNodeLbl do
        LoNodeLbl.SetBounds(Trunc((CSearchW450/5)*2) + CSpace10 + CY, 5, {270}Trunc((CSearchW450/5)*3)-50, CImageH);

      LoRzSeparator.SetBounds(Trunc((CSearchW450/5)*2), 3, 1, CImageH);

      Inc(LiCol1_Y, CY);
  end;


  procedure ApplySearch(AoNode: TcxTreeListNode; AsSearchStr: String);
  var
    LiI, LiX: Integer;
  begin
    if AoNode.HasChildren then
      for LiX := 0 to AoNode.Count-1 do
         ApplySearch(AoNode.Items[LiX], AsSearchStr); // recursive

    for LiI := 0 to AoNode.count- 1 do
    begin
      if VarToStr(AoNode.Items[LiI].Values[NameARcxTreeList1Column.ItemIndex]).ToLower.Contains(AsSearchStr.ToLower)  then
      begin
        AddMainNodeCaption(AoNode.Items[LiI]);
        Inc(LiItemsFound);
      end; //if.
    end; //for.
  end;

begin
  // Clear search
  while ResultScrollbox.ControlCount > 0 do
    ResultScrollbox.controls[0].Free;

  LiItemsFound := 0;
  LiCol1_Y := 0;
  ResultScrollBox.Width := CSearchW450;

  try
    ResultScrollBox.DisableAlign;
    ApplySearch(cxTreeList1.Items[0], cxTextEditSearch.Text);
  finally
    ResultScrollBox.EnableAlign;
  end;

  if (LiItemsFound > 10) then
    LiHeight := 10 * 30
  else
    LiHeight := LiItemsFound * 30;

  //TODO: arabic
  // set position & height
  if VbIsArabic then
    ResultScrollbox.SetBounds(PanelSearch.Left, PanelSearch.Top+30, CSearchW450{ResultScrollbox.Width}, LiHeight)
  else
    ResultScrollbox.SetBounds(PanelSearch.Left-220, PanelSearch.Top+30, CSearchW450{ResultScrollbox.Width}, LiHeight);

  // set Visibility
  ResultScrollbox.Visible := (LiItemsFound > 0) and (cxTextEditSearch.Text <> EmptyStr);
end;



procedure TForm1.FillTree;
begin
  // Modules
  with cxTreeList1.Add do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Deparments';
    Values[NameARcxTreeList1Column.ItemIndex] := '�������';
    Values[ImagecxTreeList1Column.ItemIndex] := 14;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //PF
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Preferences';
    Values[NameARcxTreeList1Column.ItemIndex] := '���������';
    Values[ImagecxTreeList1Column.ItemIndex] := 0;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 4;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //GL
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'General Ledger';
    Values[NameARcxTreeList1Column.ItemIndex] := '�������� ������';
    Values[ImagecxTreeList1Column.ItemIndex] := 1;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 1;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //MV
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Monatory Vessels';
    Values[NameARcxTreeList1Column.ItemIndex] := '������� �������';
    Values[ImagecxTreeList1Column.ItemIndex] := 2;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 7;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //SC
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Stock Control';
    Values[NameARcxTreeList1Column.ItemIndex] := '����� �������';
    Values[ImagecxTreeList1Column.ItemIndex] := 3;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 8;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //SL
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Sales';
    Values[NameARcxTreeList1Column.ItemIndex] := '��������';
    Values[ImagecxTreeList1Column.ItemIndex] := 4;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 10;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //PR
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Purchases';
    Values[NameARcxTreeList1Column.ItemIndex] := '���������';
    Values[ImagecxTreeList1Column.ItemIndex] := 5;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 9;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //CIM
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'CIM';
    Values[NameARcxTreeList1Column.ItemIndex] := '������� �������� �������';
    Values[ImagecxTreeList1Column.ItemIndex] := 6;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 5;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //FA
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Fixed Assets';
    Values[NameARcxTreeList1Column.ItemIndex] := '������ �������';
    Values[ImagecxTreeList1Column.ItemIndex] := 9;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 11;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //LC
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Letter of Credit';
    Values[NameARcxTreeList1Column.ItemIndex] := '���������� ���������';
    Values[ImagecxTreeList1Column.ItemIndex] := 10;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 12;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //FC
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Food Cost';
    Values[NameARcxTreeList1Column.ItemIndex] := '������ �������';
    Values[ImagecxTreeList1Column.ItemIndex] := 11;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 13;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //TC
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Target & Comission';
    Values[NameARcxTreeList1Column.ItemIndex] := '�������� ��������';
    Values[ImagecxTreeList1Column.ItemIndex] := 12;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 14;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;

  //PL
  with cxTreeList1.Items[0].AddChild do
  begin
    Values[NameENcxTreeList1Column.ItemIndex] := 'Planning';
    Values[NameARcxTreeList1Column.ItemIndex] := '�������';
    Values[ImagecxTreeList1Column.ItemIndex] := 13;
    Values[ModuleIdcxTreeList1Column.ItemIndex] := 15;
    Values[IsReportcxTreeList1Column.ItemIndex] := 0;
    Values[SubNodeModuleIdcxTreeList1Column.ItemIndex] := 8;
  end;


//  with cxTreeList1.Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Forms';
//
//  with cxTreeList1.Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Reports';
//
//  // forms
//  with cxTreeList1.Items[0].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Units';
//
//  with cxTreeList1.Items[0].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Items';
//
//  with cxTreeList1.Items[0].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Store';
//
//  // Reports
//  with cxTreeList1.Items[0].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Stock orders Report';
//
//  with cxTreeList1.Items[0].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Adjustments Report';
//
//  with cxTreeList1.Items[0].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Transfers Report';
//
//
//  with cxTreeList1.Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Forms';
//
//  with cxTreeList1.Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Reports';
//
//  // forms
//  with cxTreeList1.Items[1].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Batch Items';
//
//  with cxTreeList1.Items[1].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Break down transactions';
//
//  with cxTreeList1.Items[1].Items[0].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Revenue centers';
//
//  // Reports
//  with cxTreeList1.Items[1].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Sessions Report';
//
//  with cxTreeList1.Items[1].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Depreciations Report';
//
//  with cxTreeList1.Items[1].Items[1].AddChild do
//    Values[NameARcxTreeList1Column.ItemIndex] := 'Food cost Report';
end;

procedure TForm1.FillTreeImageComboBox;
var
  LiI: integer;
begin
  for LiI := 0 to Menu24ImageList.Count-1 do
  begin
   with TcxCustomImageComboBoxProperties(ImagecxTreeList1Column.Properties).Items.Add do
   begin
     ImageIndex := LiI;
     Value := LiI;
   end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  LiI: integer;
begin


  siLang.LangDispatcher := LocalizationEngine.siLangDispatcher;
  VbIsArabic := LocalizationEngine.ActiveLang = 'Arabic';
  TStyleManager.TrySetStyle(GetAppTheme);

  RzPathBar1.Items.Clear;

  mArabic.Checked := VbIsArabic;
  mEnglish.Checked := not VbIsArabic;

  // Init
  VoHistoryList := TList<Integer>.Create;
  ViListIndex := -1;
  VbNavigate := false;

  // fill data
  FillTreeImageComboBox;
  //FillTree;

  PathPanel.Width := Trunc(Screen.Width * 0.80);
  if VbIsArabic then
  begin
    PanelSearch.Left := 5;
    //PathPanel.Left := PanelSearch.Left + 10;
    PathPanel.SetBounds(PanelSearch.Left + PanelSearch.Width + 5, 4, Trunc(Screen.Width * 0.80) , 26);
    PanelPath.Left := (PanelSearch.Left + PanelSearch.Width + PathPanel.Width) - PanelPath.Width;
  end
  else
    PanelSearch.Left := PathPanel.Left + 5 +PathPanel.Width;

  ResultScrollBox.Visible := false;

  // Status bar
  with dxRibbonStatusBar.Panels do
  begin
    Items[0].Text := Format('%S [%S]', [siLang.GetTextOrDefault('IDS_Server'), '.']);
    Items[1].Text := Format('%S %S', [siLang.GetTextOrDefault('IDS_Database'), 'DB']);
    Items[2].Text := Format('%S %S', [siLang.GetTextOrDefault('IDS_Username'), 'Admin']);
  end;// with.

  setActiveImageList(smPF);

  cxTreeList1.LoadFromFile('treeitems1.txt');
end;

procedure TForm1.DoItemClick(Sender: TObject);
begin
  try
    VbNavigate := True;
    cxTreeList1.AbsoluteItems[TMenuItem(Sender).Tag].Selected := True;
  finally
    VbNavigate := false;
  end; // try..finally
end;

procedure TForm1.DoDrawItem(Sender: TObject; ACanvas: TCanvas; ARect: TRect;
  Selected: Boolean);
var
  LsCaption: string;
  LiImageIndex: Integer;
begin
  with ACanvas do
  begin
    Pen.Style := psClear;
    Font.Color := clBlack;
    if Selected then
      Font.Style := [fsBold];

    LsCaption := TMenuItem(Sender).Caption;
    LiImageIndex := TMenuItem(Sender).ImageIndex;

    Canvas.Rectangle(ARect.Left, ARect.Top, ARect.Right + 1, ARect.Bottom + 1);

    if BiDiMode = bdLeftToRight then
      TextOut(5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LsCaption)
    else
      TextOut(ARect.Right - TextWidth(LsCaption) - 5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LsCaption);


    with BoundsRect do
      Menu24ImageList.Draw(Canvas, (Left + (Right-Left) div 2) - 8, (Top + (Bottom - Top) div 2) - 8, LiImageIndex, dsTransparent, itImage)

  end;//with
end;


procedure TForm1.DoLabelClick(Sender: TObject);
begin
  cxTreeList1.AbsoluteItems[TLabel(Sender).Tag].Selected := True;
  cxTreeList1.SetFocus;
end;

procedure TForm1.DoLinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  cxTreeList1.AbsoluteItems[TLinkLabel(Sender).Tag].Selected := True;
  cxTreeList1.SetFocus;
end;

procedure TForm1.LabelMouseEnter(Sender: TObject);
begin
  (TLabel(Sender)).Font.Style := (TLabel(Sender)).Font.Style+[fsUnderLine];
  (TLabel(Sender)).Cursor := crHandPoint;
end;

procedure TForm1.LabelMouseLeave(Sender: TObject);
begin
  (TLabel(Sender)).Font.Style := (TLabel(Sender)).Font.Style-[fsUnderLine];
  (TLabel(Sender)).Cursor := crDefault;
end;

procedure TForm1.LinkLabel1Click(Sender: TObject);
begin
  ShowMessage('Clicked');
end;

procedure TForm1.LinkLabel1LinkClick(Sender: TObject; const Link: string;
  LinkType: TSysLinkType);
begin
  ShowMessage('Clicked');
end;

procedure TForm1.LoadTreeButtonClick(Sender: TObject);
begin
  cxTreeList1.LoadFromFile('treeitems1.txt');
end;

procedure TForm1.mArabicClick(Sender: TObject);
begin
  LocalizationEngine.ActiveLang := 'Arabic';
  mArabic.Checked := true;
  mEnglish.Checked := true;
end;

procedure TForm1.RzToolButtonForwardClick(Sender: TObject);
begin
  try
    VbNavigate := true;
    if cxTreeList1.Count > 0 then
    begin
      if ViListIndex < VoHistoryList.Count then
        Inc(ViListIndex);

      AdjustNavBtns;
      cxTreeList1.AbsoluteItems[VoHistoryList[ViListIndex]].Selected := True;
    end;
  finally
    VbNavigate := false;
  end;
end;

procedure TForm1.RzToolButtonHistoryClick(Sender: TObject);
begin
  //HistoryPopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  HistoryPopupMenu.Popup(RzToolButtonHistory.Left, RzToolButtonHistory.Top + 50);
end;

procedure TForm1.RzToolButtonHomePathClick(Sender: TObject);
begin
  cxTreeList1.AbsoluteItems[0].Selected := True;
  cxTreeList1.SetFocus;
end;

procedure TForm1.RzToolButtonPreviousClick(Sender: TObject);
begin
  try
    VbNavigate := true;
    if cxTreeList1.Count > 0 then
    begin
      if ViListIndex > 0 then
        dec(ViListIndex);

      AdjustNavBtns;
      cxTreeList1.AbsoluteItems[VoHistoryList[ViListIndex]].Selected := True;
    end;
  finally
    VbNavigate := false;
  end;
end;

procedure TForm1.SettingsRzMenuToolbarButtonClick(Sender: TObject);
begin
  UtilsPopupMenu.Popup(SettingsRzMenuToolbarButton.Left, SettingsRzMenuToolbarButton.Top+ 90);
end;

procedure TForm1.SidePanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender is TWinControl) then
  begin
    VbIsResizing := True;
    SetCapture(TWinControl(Sender).Handle);
    GetCursorPos(VoOldPos);
  end;
end;

procedure TForm1.SidePanelMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
const
  CminWidth = 200;
  CmaxWidth = 400;
var
  LoNewPos: TPoint;
  LoFrmPoint : TPoint;
begin
  if (X < (SidePanel.ClientWidth)) and (X > (SidePanel.ClientWidth-10)) then
    Screen.Cursor := crSizeWE
  else
    Screen.Cursor := crDefault;

  if VbIsResizing then
  begin
    with TWinControl(Sender) do
    begin
      GetCursorPos(LoNewPos);

      Screen.Cursor := crSizeNWSE;
      LoFrmPoint := ScreenToClient(Mouse.CursorPos);
      if (LoFrmPoint.X > CminWidth) and (LoFrmPoint.X < CmaxWidth) then
        Width := LoFrmPoint.X;
    end; // with
  end; // if
end;

procedure TForm1.SidePanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if VbIsResizing then
  begin
    Screen.Cursor := crDefault;
    ReleaseCapture;
    VbIsResizing := False;
  end;
end;


procedure TForm1.DoClickPathBarItem(Sender: TObject);
begin
  cxTreeList1.AbsoluteItems[TRzPathItem(Sender).Tag].Selected := True;
  cxTreeList1.SetFocus;
end;

procedure TForm1.MeasureMenuItem(Sender: TObject;
  ACanvas: TCanvas; var Width, Height: Integer);
begin
  with ACanvas do
  begin
    Font.Color := not clHighlight;
    Font.Style := [fsBold];

    Width := TextWidth(TMenuItem(Sender).Caption) + 30;
    Height := TextHeight(TMenuItem(Sender).Caption) + 10;
  end;//with
end;

procedure TForm1.mEnglishClick(Sender: TObject);
begin
  LocalizationEngine.ActiveLang := 'English';
  mEnglish.Checked := true;
  mArabic.Checked := false;
end;

procedure TForm1.mExitClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.mSelectStyleClick(Sender: TObject);
begin
  with TStylesSerialsLookupIForm.Create(Self, GetAppTheme) do
    try
      if ShowModal = mrOK then
      begin
        if StylescxGridDBTableView.DataController.FocusedRecordIndex >= 0 then
        begin
          SetAppTheme(VarToStr(StylescxGridDBTableView.DataController.Values[StylescxGridDBTableView.DataController.FocusedRecordIndex, StylecxGridDBTableViewColumn.Index]));
        end;
      end; // if
    finally
      Free
    end; // with..try..finally.
end;

procedure TForm1.mWorkDateClick(Sender: TObject);
var
  LbItemsSkiped: Boolean;
  LdCopyDate: TDateTime;
begin
  with TCMDatesTimesIForm.Create(Self) do
    try
      if ShowModal <> mrOk then
        Exit;

      LdCopyDate := DatecxDateEdit.Date;
    finally
      //Free;
    end;
end;

procedure TForm1.PanelMouseEnter(Sender: TObject);
begin
  (TPanel(Sender)).Color := clGradientActiveCaption;
  (TPanel(Sender)).Cursor := crHandPoint;
end;

procedure TForm1.PanelMouseLeave(Sender: TObject);
begin
  (TPanel(Sender)).Color := clWhite;
  (TPanel(Sender)).Cursor := crDefault;
end;

procedure TForm1.AdvancedDrawMenuItem(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; State: TOwnerDrawState);
var
  LsCaption : string;
  LiImageIndex: Integer;
begin
  LsCaption := TMenuItem(Sender).Caption ;
  Delete(LsCaption,POS('&',TMenuItem(Sender).Caption), 1);
  LiImageIndex := TMenuItem(Sender).ImageIndex;

  with ACanvas, BoundsRect do
  begin
    Pen.Style := psClear;
    Font.Color := clBlack;
    if odChecked in State then
      Font.Style := [fsBold];

    Canvas.Rectangle(ARect.Left, ARect.Top, ARect.Right + 1, ARect.Bottom + 1);

    if BiDiMode = bdLeftToRight then
      TextOut(5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LsCaption)
    else
      TextOut(ARect.Right - TextWidth(LsCaption) - 5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LsCaption);

    //with Bounds do
      //Canvas.Rectangle(Left, Top, Right, Bottom + 1);

      Menu24ImageList.Draw(Canvas, 5, ARect.Top + ((ARect.Bottom - ARect.Top) - TextHeight(LsCaption)) div 2, LiImageIndex, dsTransparent, itImage)
      //Menu24ImageList.Draw(Canvas, (Left + (Right-Left) div 2) - 8, (Top + (Bottom - Top) div 2) - 8, LiImageIndex, dsTransparent, itImage)
  end;//with
end;

function TForm1.GetAppTheme: string;
var
  VSFileName: String;
  OIniFile: TIniFile;

  function ReadSettingValue(const SettingName: string): string;
  begin
    with OIniFile do
    begin
      Result := '';
      if ValueExists('CMAS Styles', SettingName) then
        Result := ReadString('CMAS Styles', SettingName, '')
      else
        raise Exception.Create('Invalid Ini File');
    end; // with
  end;

begin
  VSFileName := ExtractFilePath(Application.ExeName) + 'Styles.ini';

  Result := 'Windows';
  if FileExists(VSFileName) then
  begin
    OIniFile := TIniFile.Create(VSFileName);
    try
      Result := ReadSettingValue('Style Name');
    finally
      OIniFile.Free;
    end; // try..finally
  end // with
  else
    raise Exception.Create('Ini File not found');

end;


function TForm1.IIF(AbExpression: boolean; AvTrue, AvFalse: Variant): Variant;
begin
   if AbExpression then
     Result := AvTrue
   else
     Result := AvFalse;
end;

procedure TForm1.SetAppTheme(VsAppTheme: string);
var
  VSFileName: String;
  OIniFile: TIniFile;

  Procedure WriteSettingValue(const SettingName: string);
  begin
    with OIniFile do
    begin
      if ValueExists('CMAS Styles', 'Style Name') then
        WriteString('CMAS Styles', 'Style Name', VsAppTheme)
      else
        raise Exception.Create('Invalid Ini File');
    end; // with
  end;

begin
  VSFileName := ExtractFilePath(Application.ExeName) + 'Styles.ini';

  if FileExists(VSFileName) then
  begin
    OIniFile := TIniFile.Create(VSFileName);
    try
      WriteSettingValue(VsAppTheme);
      TStyleManager.TrySetStyle(VsAppTheme);
    finally
      OIniFile.Free;
    end; // try..finally
  end // with
  else
    raise Exception.Create('Ini File not found');

end;



end.
