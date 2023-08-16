import { Request, Response } from 'express';
import { AzureKeyCredential, OpenAIClient } from '@azure/openai';
import { AZURE_OPENAI_ACCESS_KEY, AZURE_OPENAI_ENDPOINT } from './consts';

const messages = [
  { role: 'system', content: 'You are a helpful assistant.' },
  { role: 'user', content: 'Does Azure OpenAI support customer managed keys?' },
  { role: 'assistant', content: 'Yes, customer managed keys are supported by Azure OpenAI' },
  { role: 'user', content: 'Do other Azure AI services support this too' },
];

export const chat = async (req: Request, res: Response) => {
  const client = new OpenAIClient(AZURE_OPENAI_ENDPOINT, new AzureKeyCredential(AZURE_OPENAI_ACCESS_KEY));

  const deploymentId = 'gpt-35-turbo';

  const result = await client.getChatCompletions(deploymentId, messages);

  for (const choice of result.choices) {
    console.log(choice.message);
  }

  res.send();
};
