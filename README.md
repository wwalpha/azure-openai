# azure-openai

## Core Technology
- TypeScript
- React
- Azure OpenAI Service
- Azure Cognitive search
- Azure App Service
- Terraform

## Architecture

## Total Costs
一番安いの `East US` リージョンを基準とする

- OpenAI Service
  - OnDemand
- Cognitive Search (Basic)
  - $80.3/month
- App Service Plan (Free Plan)
  - 60 CPU minutes/day

## 向いてない事
- 画像関連の文章
  - 文章のみの回答は理解できない
- 完全ではない文章
  - 問題集は一部抜き取られたから、AI は理解できない
- 文章のタブ分類がないため、AI はカテゴリー理解できない
